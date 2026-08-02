package com.flare.im.model.content

import com.flare.im.model.media.MediaSourceInfo

/** GENERATED. Do not edit by hand. */
/** Video message payload. */
data class VideoContentPayload(
    /** wire: `videoId`. Uploaded video id. */
    val videoId: String? = null,
    /** wire: `source`. Video source. */
    val source: MediaSourceInfo? = null,
    /** wire: `cover`. Cover image. */
    val cover: MediaSourceInfo? = null,
    /** wire: `description`. Caption. */
    val description: String? = null,
)
