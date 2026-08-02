import 'dart:ffi';

import 'package:ffi/ffi.dart';

/// C ABI `FlareString`.
final class NativeFlareString extends Struct {
  external Pointer<Utf8> ptr;

  @Size()
  external int len;
}

/// C ABI `FlareBytesView`.
final class NativeFlareBytesView extends Struct {
  external Pointer<Uint8> ptr;

  @Size()
  external int len;
}

/// C ABI `FlareError`.
final class NativeFlareError extends Struct {
  @Int32()
  external int code;

  external NativeFlareString message;
  external NativeFlareString detailsJson;
}

String decodeFlareString(NativeFlareString value) {
  if (value.ptr == nullptr || value.len <= 0) {
    return '';
  }
  final text = value.ptr.cast<Utf8>().toDartString(length: value.len);
  return text.endsWith('\u0000') ? text.substring(0, text.length - 1) : text;
}
