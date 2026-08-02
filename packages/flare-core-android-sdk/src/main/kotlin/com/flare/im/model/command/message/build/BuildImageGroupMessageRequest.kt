package com.flare.im.model.command.message.build

import com.flare.im.model.content.ImageGroupContentPayload

/** GENERATED. Do not edit by hand. */
/** Build an image group message. */
data class BuildImageGroupMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `payload`. Image group payload. */
    val payload: ImageGroupContentPayload,
)
