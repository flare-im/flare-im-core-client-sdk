package com.flare.im.model.media

/** GENERATED. Do not edit by hand. */
/** Image/video/audio/file source descriptor (uuid, url, dimensions). */
data class MediaSourceInfo(
    /** wire: `uuid`. Stable media uuid. */
    val uuid: String? = null,
    /** wire: `imageId`. Image id when applicable. */
    val imageId: String? = null,
    /** wire: `url`. Resolved URL. */
    val url: String? = null,
    /** wire: `mimeType`. MIME type. */
    val mimeType: String? = null,
    /** wire: `size`. Byte size. */
    val size: Long? = null,
    /** wire: `width`. Width in pixels. */
    val width: Int? = null,
    /** wire: `height`. Height in pixels. */
    val height: Int? = null,
    /** wire: `blurhash`. Blurhash placeholder for image previews. */
    val blurhash: String? = null,
    /** wire: `durationMs`. Duration for audio/video. */
    val durationMs: Int? = null,
)
