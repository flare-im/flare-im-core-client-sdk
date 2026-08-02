package com.flare.im.model.command.message.build

import com.flare.im.model.content.AudioContentPayload

/** GENERATED. Do not edit by hand. */
/** Build an audio message. */
data class BuildAudioMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `audioId`. Uploaded audio id. */
    val audioId: String = "",
    /** wire: `payload`. Optional audio payload. */
    val payload: AudioContentPayload? = null,
)
