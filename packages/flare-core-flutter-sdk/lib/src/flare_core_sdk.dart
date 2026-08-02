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
final class FlareSdkException implements Exception {
  const FlareSdkException({
    required this.code,
    required this.message,
    this.operation,
    this.details,
  });

  final String code;
  final String message;
  final String? operation;
  final Object? details;

  @override
  String toString() {
    final op = operation == null ? '' : ' operation=$operation';
    return 'FlareSdkException(code=$code$op, message=$message)';
  }
}
