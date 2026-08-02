package com.flare.im.model.common.error

/** GENERATED. Do not edit by hand. */
/** Stable error payload used by lifecycle and async notification failures. */
data class SdkErrorPayload(
    /** wire: `code`. Stable machine-readable error code. */
    val code: String = "",
    /** wire: `message`. Human-readable error message. */
    val message: String = "",
    /** wire: `operation`. Operation that failed. */
    val operation: String? = null,
    /** wire: `retryable`. Whether retrying may succeed. */
    val retryable: Boolean? = null,
    /** wire: `details`. Opaque diagnostic details. */
    val details: Map<String, String> = emptyMap(),
)
