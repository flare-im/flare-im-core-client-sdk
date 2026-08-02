package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Request for opening an observable conversation list view. */
data class OpenConversationListViewRequest(
    /** wire: `conversationLimit`. Maximum conversations to include in the initial snapshot. */
    val conversationLimit: Int = 0,
)
