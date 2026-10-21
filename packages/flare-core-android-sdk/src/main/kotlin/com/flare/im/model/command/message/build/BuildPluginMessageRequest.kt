package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Generic safe plugin message over the existing AppCard envelope. */
data class BuildPluginMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `payload`. Validated generic plugin message envelope defined by flare-plugin-protocol. */
    val payload: Map<String, Any?> = emptyMap(),
)
