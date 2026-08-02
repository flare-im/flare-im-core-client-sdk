package com.flare.im.model.command.message.build

import com.flare.im.model.content.FileContentPayload

/** GENERATED. Do not edit by hand. */
/** Build a file message. */
data class BuildFileMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `fileId`. Uploaded file id. */
    val fileId: String = "",
    /** wire: `payload`. Optional file payload. */
    val payload: FileContentPayload? = null,
)
