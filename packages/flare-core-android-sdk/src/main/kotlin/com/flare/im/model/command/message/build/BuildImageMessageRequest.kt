package com.flare.im.model.command.message.build

import com.flare.im.model.content.ImageContentPayload

/** GENERATED. Do not edit by hand. */
/** Build an image message. */
data class BuildImageMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `imageId`. Uploaded image id. */
    val imageId: String = "",
    /** wire: `payload`. Optional rich image payload for UI preview. */
    val payload: ImageContentPayload? = null,
)
