package com.flare.im.contract

/** GENERATED. Do not edit by hand. */
/** Describes how one SDK operation reaches the native layer. */
data class NativeCallDescriptor(
    val module: String,
    val method: String,
    val operation: String,
    val transport: String,
    val cApi: String,
    val requestEncoding: String,
    val responseEncoding: String,
    val returnMode: String,
    val handlePolicy: String,
    val dispatchOp: String? = null,
    val callback: String? = null,
)
