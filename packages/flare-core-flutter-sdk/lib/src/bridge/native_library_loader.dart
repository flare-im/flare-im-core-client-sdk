import 'dart:ffi';
import 'dart:io';

import '../flare_core_sdk.dart';

const _libraryBaseName = 'flare_im_core_sdk_ffi';

/// Loads the Flare Core C ABI library for the current Flutter target.
DynamicLibrary loadFlareNativeLibrary({String? libraryPath}) {
  if (libraryPath != null && libraryPath.trim().isNotEmpty) {
    return DynamicLibrary.open(libraryPath);
  }

  if (Platform.isIOS) {
    return DynamicLibrary.process();
  }

  final candidates = <String>[
    if (Platform.isMacOS) ...[
      'lib$_libraryBaseName.dylib',
      'macos/Runner/lib$_libraryBaseName.dylib',
    ],
    if (Platform.isAndroid || Platform.isLinux) 'lib$_libraryBaseName.so',
    if (Platform.isWindows) '$_libraryBaseName.dll',
  ];

  Object? lastError;
  for (final candidate in candidates) {
    try {
      return DynamicLibrary.open(candidate);
    } on ArgumentError catch (error) {
      lastError = error.message;
    }
  }

  if (candidates.isNotEmpty) {
    throw FlareSdkException(
      code: 'native_library_load_failed',
      message:
          'Unable to load lib$_libraryBaseName for this platform. Build and bundle the FFI artifact first.',
      details: {'candidates': candidates, 'lastError': lastError},
    );
  }

  throw const FlareSdkException(
    code: 'unsupported_platform',
    message: 'Flare Core Flutter SDK currently requires a dart:ffi platform.',
  );
}
