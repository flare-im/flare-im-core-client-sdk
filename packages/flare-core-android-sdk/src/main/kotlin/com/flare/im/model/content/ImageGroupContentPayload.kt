package com.flare.im.model.content

/** GENERATED. Do not edit by hand. */
/** Image group payload. */
data class ImageGroupContentPayload(
    /** wire: `images`. Grouped images. */
    val images: List<ImageGroupItem> = emptyList(),
    /** wire: `title`. Group title. */
    val title: String? = null,
)
