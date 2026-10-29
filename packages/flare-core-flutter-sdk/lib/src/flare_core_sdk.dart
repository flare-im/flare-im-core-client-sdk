import 'dart:ffi';

import 'api/api.dart';
import 'contract/bridge_contract.dart';
import 'bridge/ffi_native_bridge.dart';
import 'adapter/default_flare_im_client.dart';
import 'bridge/native_library_loader.dart';

/// Public entry point for creating a Flutter client backed by the core SDK FFI.
abstract final class FlareCoreSdk {
  const FlareCoreSdk._();

  /// Creates a ready-to-use client with the default platform native library.
  static FlareImClient createClient({
    DynamicLibrary? library,
    String? libraryPath,
  }) {
    final bridge = FfiNativeBridge(
      library: library,
      libraryPath: libraryPath,
    );
    return DefaultFlareImClient(bridge);
  }

  /// Creates a client from a custom bridge, useful for host integration tests.
  static FlareImClient createClientWithBridge(NativeBridge bridge) {
    return DefaultFlareImClient(bridge);
  }

  /// Loads the native FFI library with the same default policy used by
  /// [createClient].
  static DynamicLibrary loadNativeLibrary({String? libraryPath}) {
    return loadFlareNativeLibrary(libraryPath: libraryPath);
  }
}

/// Stable Dart exception surfaced by the Flutter SDK runtime.
///
/// An SDK failure carries the binding's structured error
/// (`bindings/contract/errors.json`): [code] is the core error code
/// (`PERMISSION_DENIED`), [reason] the localized key (`sdk.plugin.disabled`),
/// [machineReason] Core's or the plugin's code (`PLUGIN_DISABLED`, `CALL_FULL`),
/// [httpStatus] and [remoteCode] Core's answer. Read these, never [message].
final class FlareSdkException implements Exception {
  const FlareSdkException({
    required this.code,
    required this.message,
    this.operation,
    this.details,
    this.reason,
    this.retryable = false,
    this.httpStatus,
    this.remoteCode,
    this.machineReason,
  });

  /// The exception for a failed native call: the structured error in
  /// `details_json` when the SDK wrote one, else the C ABI code alone.
  factory FlareSdkException.fromNative({
    required int nativeCode,
    required String message,
    required String? operation,
    required Object? details,
  }) {
    final structured = details is Map ? details : const <Object?, Object?>{};
    final code = structured['code'];
    final reason = structured['reason'];
    final httpStatus = structured['httpStatus'];
    final remoteCode = structured['remoteCode'];
    final machineReason = structured['machineReason'];
    return FlareSdkException(
      code: code is String && code.isNotEmpty ? code : 'native_error_$nativeCode',
      message: message,
      operation: operation,
      details: details,
      reason: reason is String ? reason : null,
      retryable: structured['retryable'] == true,
      httpStatus: httpStatus is int ? httpStatus : null,
      remoteCode: remoteCode is int ? remoteCode : null,
      machineReason: machineReason is String ? machineReason : null,
    );
  }

  final String code;
  final String message;
  final String? operation;
  final Object? details;
  final String? reason;
  final bool retryable;
  final int? httpStatus;
  final int? remoteCode;
  final String? machineReason;

  @override
  String toString() {
    final op = operation == null ? '' : ' operation=$operation';
    return 'FlareSdkException(code=$code$op, message=$message)';
  }
}
