package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a custom extension message. */
data class BuildCustomMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `type`. Extension type key. */
    val type: String = "",
)
