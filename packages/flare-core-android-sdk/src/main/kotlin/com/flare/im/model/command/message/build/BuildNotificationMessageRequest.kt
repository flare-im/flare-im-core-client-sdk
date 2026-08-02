package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a notification message. */
data class BuildNotificationMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `title`. Notification title. */
    val title: String = "",
    /** wire: `body`. Notification body. */
    val body: String = "",
)
