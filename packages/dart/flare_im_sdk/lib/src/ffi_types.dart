import 'dart:ffi';

import 'package:ffi/ffi.dart';

/// C ABI `FlareString { *mut c_char ptr; usize len; }`.
/// `len` includes the trailing NUL (Rust `CString::as_bytes_with_nul().len()`).
final class NativeFlareString extends Struct {
  external Pointer<Utf8> ptr;

  @Size()
  external int len;
}

/// C ABI `FlareError { i32 code; FlareString message; FlareString details_json; }`.
final class NativeFlareError extends Struct {
  @Int32()
  external int code;

  external NativeFlareString message;
  external NativeFlareString detailsJson;
}

/// Read a Rust-owned [NativeFlareString] into a Dart string (does NOT free it).
/// Strips the trailing NUL byte that Rust includes in `len`.
String decodeFlareString(NativeFlareString value) {
  if (value.ptr == nullptr || value.len <= 0) {
    return '';
  }
  final text = value.ptr.cast<Utf8>().toDartString(length: value.len);
  if (text.isNotEmpty && text.codeUnitAt(text.length - 1) == 0) {
    return text.substring(0, text.length - 1);
  }
  return text;
}
