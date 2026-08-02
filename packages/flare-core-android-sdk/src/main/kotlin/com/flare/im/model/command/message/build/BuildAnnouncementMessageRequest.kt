package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build an announcement message. */
data class BuildAnnouncementMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `title`. Announcement title. */
    val title: String = "",
    /** wire: `body`. Announcement body. */
    val body: String = "",
)
