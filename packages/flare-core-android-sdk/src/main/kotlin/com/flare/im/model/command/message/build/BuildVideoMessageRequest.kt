package com.flare.im.model.command.message.build

import com.flare.im.model.content.VideoContentPayload

/** GENERATED. Do not edit by hand. */
/** Build a video message. */
data class BuildVideoMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `videoId`. Uploaded video id. */
    val videoId: String = "",
    /** wire: `payload`. Optional video payload. */
    val payload: VideoContentPayload? = null,
)
