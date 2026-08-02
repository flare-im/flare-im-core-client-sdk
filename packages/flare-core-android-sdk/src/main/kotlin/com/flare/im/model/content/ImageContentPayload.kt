package com.flare.im.model.content

import com.flare.im.model.media.MediaSourceInfo

/** GENERATED. Do not edit by hand. */
/** Image message payload. */
data class ImageContentPayload(
    /** wire: `imageId`. Uploaded image id. */
    val imageId: String? = null,
    /** wire: `source`. Source descriptor. */
    val source: MediaSourceInfo? = null,
    /** wire: `thumbnail`. Thumbnail descriptor. */
    val thumbnail: MediaSourceInfo? = null,
    /** wire: `description`. Caption. */
    val description: String? = null,
)
