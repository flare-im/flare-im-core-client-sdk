package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a task message. */
data class BuildTaskMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `taskId`. Task id. */
    val taskId: String = "",
    /** wire: `title`. Task title. */
    val title: String = "",
    /** wire: `status`. Task status. */
    val status: String? = null,
    /** wire: `participantUserIds`. Task participants. */
    val participantUserIds: List<String> = emptyList(),
)
