package com.flare.im.model.content

import com.flare.im.model.media.MediaSourceInfo

/** GENERATED. Do not edit by hand. */
/** Audio message payload. */
data class AudioContentPayload(
    /** wire: `audioId`. Uploaded audio id. */
    val audioId: String? = null,
    /** wire: `source`. Audio source. */
    val source: MediaSourceInfo? = null,
    /** wire: `durationMs`. Duration. */
    val durationMs: Int? = null,
)
