package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Typed request for updating the current user's synced conversation draft. */
data class UpdateConversationDraftRequest(
    /** wire: `conversationId`. Conversation id whose draft is being updated. */
    val conversationId: String = "",
    /** wire: `draft`. Draft text. Omit or set null to clear the draft. */
    val draft: String? = null,
)
