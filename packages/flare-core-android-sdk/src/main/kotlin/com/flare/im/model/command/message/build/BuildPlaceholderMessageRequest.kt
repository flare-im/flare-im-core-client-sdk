package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a placeholder message. */
data class BuildPlaceholderMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `reason`. Placeholder reason. */
    val reason: String = "",
)
