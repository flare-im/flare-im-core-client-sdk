package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a schedule message. */
data class BuildScheduleMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `scheduleId`. Schedule id. */
    val scheduleId: String = "",
    /** wire: `title`. Schedule title. */
    val title: String = "",
    /** wire: `startTimeMs`. Start time in milliseconds since epoch. */
    val startTimeMs: Long = 0L,
    /** wire: `endTimeMs`. End time in milliseconds since epoch. */
    val endTimeMs: Long = 0L,
    /** wire: `participantUserIds`. Schedule participants. */
    val participantUserIds: List<String> = emptyList(),
)
