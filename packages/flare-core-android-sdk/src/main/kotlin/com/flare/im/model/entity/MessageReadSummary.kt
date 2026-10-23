package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Who read one of the viewer's own messages in a group, the sender excluded: total = readCount + unreadCount, always above 0. */
data class MessageReadSummary(
    /** wire: `readCount`. Members who read the message. */
    val readCount: Int = 0,
    /** wire: `unreadCount`. Members who have not read it yet. */
    val unreadCount: Int = 0,
    /** wire: `total`. Members the message counts, the sender excluded. */
    val total: Int = 0,
)
