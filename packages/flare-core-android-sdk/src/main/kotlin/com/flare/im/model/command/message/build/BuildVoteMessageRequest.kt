package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a vote message. */
data class BuildVoteMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `voteId`. Vote id. */
    val voteId: String = "",
    /** wire: `title`. Vote title. */
    val title: String = "",
    /** wire: `options`. Vote options. */
    val options: List<String> = emptyList(),
    /** wire: `participantUserIds`. Participants allowed to vote. */
    val participantUserIds: List<String> = emptyList(),
)
