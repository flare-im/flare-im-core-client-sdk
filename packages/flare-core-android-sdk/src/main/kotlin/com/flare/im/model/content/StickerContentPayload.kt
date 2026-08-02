package com.flare.im.model.content

/** GENERATED. Do not edit by hand. */
/** Sticker message payload. */
data class StickerContentPayload(
    /** wire: `stickerId`. Sticker id. */
    val stickerId: String = "",
    /** wire: `packageId`. Sticker package id. */
    val packageId: String? = null,
    /** wire: `url`. Sticker URL. */
    val url: String? = null,
    /** wire: `width`. Width. */
    val width: Int? = null,
    /** wire: `height`. Height. */
    val height: Int? = null,
    /** wire: `format`. webp/gif/png. */
    val format: String? = null,
)
