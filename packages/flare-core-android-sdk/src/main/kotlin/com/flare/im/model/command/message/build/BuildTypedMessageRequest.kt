package com.flare.im.model.command.message.build

import com.flare.im.model.catalog.MessageBuildOp

/** GENERATED. Do not edit by hand. */
/** Generic typed build request used by composer helpers. */
data class BuildTypedMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `op`. Build operation. */
    val op: MessageBuildOp,
    /** wire: `data`. Operation-specific payload; prefer typed buildXxx requests. */
    val data: Map<String, Any?>? = null,
)
