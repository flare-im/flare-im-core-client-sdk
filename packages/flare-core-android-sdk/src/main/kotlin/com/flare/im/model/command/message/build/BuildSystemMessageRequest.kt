package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a system message. */
data class BuildSystemMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `eventKind`. System event kind. */
    val eventKind: String = "",
    /** wire: `body`. System event body. */
    val body: String = "",
)
