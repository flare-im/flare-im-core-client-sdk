import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:ffi/ffi.dart';

import 'ffi_types.dart';

/// Error surfaced from the native `flare-sdk-ffi` layer.
class FlareSdkException implements Exception {
  const FlareSdkException(this.code, this.message, {this.details});

  final String code;
  final String message;
  final Object? details;

  @override
  String toString() => 'FlareSdkException($code): $message';
}

// ── C ABI callback typedefs ──────────────────────────────────────────────
// `extern "C" fn(context: *mut c_void, error: *const FlareError, result: FlareString)`
typedef _ResultCbNative = Void Function(
  Pointer<Void>,
  Pointer<NativeFlareError>,
  NativeFlareString,
);

// ── C function typedefs (native / dart) ──────────────────────────────────
typedef _CreateNative = Uint64 Function();
typedef _CreateDart = int Function();

typedef _ReleaseNative = Void Function(Uint64);
typedef _ReleaseDart = void Function(int);

typedef _InitNative = Int32 Function(
    Uint64, Pointer<Utf8>, Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);
typedef _InitDart = int Function(
    int, Pointer<Utf8>, Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);

typedef _LoginNative = Int32 Function(
    Uint64, Pointer<Utf8>, Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);
typedef _LoginDart = int Function(
    int, Pointer<Utf8>, Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);

typedef _LogoutNative = Int32 Function(
    Uint64, Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);
typedef _LogoutDart = int Function(
    int, Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);

typedef _DispatchNative = Int32 Function(Uint64, Pointer<Utf8>, Pointer<Utf8>,
    Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);
typedef _DispatchDart = int Function(int, Pointer<Utf8>, Pointer<Utf8>,
    Pointer<Void>, Pointer<NativeFunction<_ResultCbNative>>);

typedef _StringFreeNative = Void Function(NativeFlareString);
typedef _StringFreeDart = void Function(NativeFlareString);

typedef _ErrorFreeNative = Void Function(Pointer<NativeFlareError>);
typedef _ErrorFreeDart = void Function(Pointer<NativeFlareError>);

/// Loads the statically-linked `flare_sdk_ffi` symbols from the host process.
/// On iOS the `.a` is force-loaded into Runner, so `DynamicLibrary.process()`
/// resolves the `flare_sdk_*` symbols directly.
DynamicLibrary _openLibrary() {
  if (Platform.isIOS || Platform.isMacOS) {
    return DynamicLibrary.process();
  }
  // Other platforms: symbols are expected in-process too (static link).
  return DynamicLibrary.process();
}

final class _Bindings {
  _Bindings(DynamicLibrary lib)
      : create = lib.lookupFunction<_CreateNative, _CreateDart>('flare_sdk_create'),
        release =
            lib.lookupFunction<_ReleaseNative, _ReleaseDart>('flare_sdk_release'),
        init = lib.lookupFunction<_InitNative, _InitDart>('flare_sdk_init'),
        login = lib.lookupFunction<_LoginNative, _LoginDart>(
            'flare_sdk_login_with_password'),
        logout =
            lib.lookupFunction<_LogoutNative, _LogoutDart>('flare_sdk_logout'),
        dispatch = lib.lookupFunction<_DispatchNative, _DispatchDart>(
            'flare_sdk_flare_dispatch_json'),
        imDispatch = lib.lookupFunction<_DispatchNative, _DispatchDart>(
            'flare_sdk_im_dispatch_json'),
        stringFree = lib.lookupFunction<_StringFreeNative, _StringFreeDart>(
            'flare_string_free'),
        errorHeapFree = lib.lookupFunction<_ErrorFreeNative, _ErrorFreeDart>(
            'flare_error_heap_free');

  final _CreateDart create;
  final _ReleaseDart release;
  final _InitDart init;
  final _LoginDart login;
  final _LogoutDart logout;
  final _DispatchDart dispatch;
  final _DispatchDart imDispatch;
  final _StringFreeDart stringFree;
  final _ErrorFreeDart errorHeapFree;
}

class _Pending {
  _Pending(this.operation, this.completer);
  final String operation;
  final Completer<String> completer;
}

// The C callback fires on a Rust tokio thread → `NativeCallable.listener`
// marshals it onto the Dart event loop. Ownership of `error`/`result` is
// transferred to us, so we free them here (heap-free error, string-free result).
final _pending = <int, _Pending>{};
int _nextContextId = 1;
_Bindings? _activeBindings;

final NativeCallable<_ResultCbNative> _resultCallable =
    NativeCallable<_ResultCbNative>.listener(_handleResult);

void _handleResult(
  Pointer<Void> context,
  Pointer<NativeFlareError> error,
  NativeFlareString result,
) {
  final pending = _pending.remove(context.address);
  final bindings = _activeBindings;
  if (error != nullptr) {
    final message = decodeFlareString(error.ref.message);
    final detailsJson = decodeFlareString(error.ref.detailsJson);
    final code = error.ref.code;
    bindings?.errorHeapFree(error);
    pending?.completer.completeError(FlareSdkException(
      'native_error_$code',
      message.isEmpty ? 'native operation failed' : message,
      details: _tryJson(detailsJson),
    ));
    return;
  }
  final raw = decodeFlareString(result);
  bindings?.stringFree(result);
  pending?.completer.complete(raw);
}

Object? _tryJson(String raw) {
  if (raw.trim().isEmpty) return null;
  try {
    return jsonDecode(raw);
  } catch (_) {
    return raw;
  }
}

/// Init config accepted by [SdkWrapper.init]. `wsUrl` is the IM signaling WS;
/// the social gateway defaults to `http://127.0.0.1:50200` in the Rust core.
class SdkConfig {
  const SdkConfig({
    required this.wsUrl,
    this.tenantId = '0',
    this.deviceId = 'flutter-ios',
  });

  final String wsUrl;
  final String tenantId;
  final String deviceId;

  Map<String, Object?> toOverlayJson() => {
        'ws_url': wsUrl,
        'tenant_id': tenantId,
        'device_id': deviceId,
      };
}

/// Async facade over the `flare-sdk-ffi` C ABI — the API the example apps
/// (`base_social_client.dart`) consume.
class SdkWrapper {
  SdkWrapper() {
    _bindings = _Bindings(_openLibrary());
    _activeBindings = _bindings;
  }

  late final _Bindings _bindings;
  int _handle = 0;
  bool _initialized = false;

  bool get isInitialized => _initialized;

  void _ensureHandle() {
    if (_handle == 0) {
      _handle = _bindings.create();
      if (_handle == 0) {
        throw const FlareSdkException(
            'create_failed', 'flare_sdk_create returned a null handle');
      }
    }
  }

  Future<String> _enqueue(
    String operation,
    int Function(Pointer<Void> ctx, Pointer<NativeFunction<_ResultCbNative>> cb) start,
  ) {
    final id = _nextContextId++;
    final completer = Completer<String>();
    _pending[id] = _Pending(operation, completer);
    final code = start(Pointer<Void>.fromAddress(id), _resultCallable.nativeFunction);
    if (code != 0) {
      // Sync failure: the native side already delivered an error via the
      // (queued) callback, which will find no pending entry and no-op.
      _pending.remove(id);
      completer.completeError(FlareSdkException(
          'native_error_$code', '$operation failed with code $code before callback'));
    }
    return completer.future;
  }

  Future<void> init(SdkConfig config) async {
    _ensureHandle();
    final cfg = jsonEncode(config.toOverlayJson()).toNativeUtf8();
    try {
      await _enqueue('init', (ctx, cb) => _bindings.init(_handle, cfg, ctx, cb));
      _initialized = true;
    } finally {
      malloc.free(cfg);
    }
  }

  /// Login by password (login_type / login_key / password). On success the IM
  /// session is connected, so we report `imConnected: true`.
  Future<Map<String, Object?>> loginWithPassword({
    required int loginType,
    required String loginKey,
    required String password,
  }) async {
    _ensureHandle();
    final params = jsonEncode({
      'login_type': loginType,
      'login_key': loginKey,
      'password': password,
      'device_id': '',
    }).toNativeUtf8();
    try {
      await _enqueue(
          'login', (ctx, cb) => _bindings.login(_handle, params, ctx, cb));
    } finally {
      malloc.free(params);
    }
    return {'imConnected': true};
  }

  /// Registration is not exposed by the C ABI (login only). Kept for API
  /// compatibility with the example app; use an existing account to log in.
  Future<Map<String, Object?>> registerWithPassword({
    required int loginType,
    required String loginKey,
    required String password,
    String? displayName,
  }) async {
    throw const FlareSdkException('register_unsupported',
        'registerWithPassword is not wired in the C ABI; register via the gateway and log in.');
  }

  Future<void> logout() async {
    if (_handle == 0) return;
    await _enqueue('logout', (ctx, cb) => _bindings.logout(_handle, ctx, cb));
  }

  /// Social dispatch: `op` must be a full `social.<module>.<action>` op.
  Future<Object?> socialDispatchJson(String op, Map<String, Object?> params) async {
    _ensureHandle();
    final opPtr = op.toNativeUtf8();
    final paramsPtr = jsonEncode(params).toNativeUtf8();
    try {
      final raw = await _enqueue('dispatch:$op',
          (ctx, cb) => _bindings.dispatch(_handle, opPtr, paramsPtr, ctx, cb));
      return raw.trim().isEmpty ? null : jsonDecode(raw);
    } finally {
      malloc.free(opPtr);
      malloc.free(paramsPtr);
    }
  }

  /// IM-core dispatch: `op` is an IM api id such as `conversation.list`,
  /// `message.list`, `message.create_text`, `message.send`, `media.get_url`.
  /// Forwards to the same connected session as the social surface (one client,
  /// one event bus) via the C `flare_sdk_im_dispatch_json` entry.
  Future<Object?> imDispatchJson(String op, Map<String, Object?> params) async {
    _ensureHandle();
    final opPtr = op.toNativeUtf8();
    final paramsPtr = jsonEncode(params).toNativeUtf8();
    try {
      final raw = await _enqueue('im:$op',
          (ctx, cb) => _bindings.imDispatch(_handle, opPtr, paramsPtr, ctx, cb));
      return raw.trim().isEmpty ? null : jsonDecode(raw);
    } finally {
      malloc.free(opPtr);
      malloc.free(paramsPtr);
    }
  }
}
