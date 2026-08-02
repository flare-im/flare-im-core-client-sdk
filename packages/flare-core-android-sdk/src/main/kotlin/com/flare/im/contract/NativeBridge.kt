package com.flare.im.contract

/** GENERATED. Do not edit by hand. */
/** Platform runtimes implement this bridge using FFI, JNI, N-API, WASM or host IPC. */
interface NativeBridge {
    suspend fun <T> invoke(descriptor: NativeCallDescriptor, request: Any? = null): T
}
