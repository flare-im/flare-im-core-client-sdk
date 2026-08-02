package com.flare.im.model.command.message.build

import com.flare.im.model.content.StickerContentPayload

/** GENERATED. Do not edit by hand. */
/** Build a sticker message. */
data class BuildStickerMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `stickerId`. Sticker id. */
    val stickerId: String = "",
    /** wire: `packageId`. Sticker package id. */
    val packageId: String? = null,
    /** wire: `payload`. Optional sticker payload. */
    val payload: StickerContentPayload? = null,
)
