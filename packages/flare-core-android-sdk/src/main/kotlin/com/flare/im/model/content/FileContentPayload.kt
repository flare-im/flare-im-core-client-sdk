package com.flare.im.model.content

/** GENERATED. Do not edit by hand. */
/** File message payload. */
data class FileContentPayload(
    /** wire: `fileId`. Uploaded file id. */
    val fileId: String? = null,
    /** wire: `name`. Display name. */
    val name: String? = null,
    /** wire: `url`. Download URL. */
    val url: String? = null,
    /** wire: `mimeType`. MIME type. */
    val mimeType: String? = null,
    /** wire: `size`. Byte size. */
    val size: Long? = null,
)
