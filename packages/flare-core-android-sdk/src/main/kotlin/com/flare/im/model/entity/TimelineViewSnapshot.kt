package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** The window of a timeline view: rows in timeline order and where it stands. */
data class TimelineViewSnapshot(
    /** wire: `conversation`. Conversation header. */
    val conversation: Conversation? = null,
    /** wire: `messages`. Rows in timeline order (oldest first); pending rows trail when the window is attached to the latest. */
    val messages: List<Message> = emptyList(),
    /** wire: `hasOlder`. More visible messages exist below the oldest row; answered by the proven seq ranges only. */
    val hasOlder: Boolean = false,
    /** wire: `hasNewer`. More messages exist above the newest row; true exactly when attachedToLatest is false. */
    val hasNewer: Boolean = false,
    /** wire: `attachedToLatest`. The newest row is the latest local message and live messages are appended. */
    val attachedToLatest: Boolean = false,
    /** wire: `anchorKey`. Row key of the target when the view was opened around a message. */
    val anchorKey: String? = null,
)
