package com.flare.im.model.command

import com.flare.im.model.entity.TimelineAnchor

/** GENERATED. Do not edit by hand. */
/** Request for opening an observable conversation timeline view. */
data class OpenTimelineViewRequest(
    /** wire: `conversationId`. Conversation id to observe. */
    val conversationId: String = "",
    /** wire: `messageLimit`. Page size: rows in the initial window and in each older or newer page when a paging request does not give its own (core default 40, at most 100). */
    val messageLimit: Int = 0,
    /** wire: `anchor`. Open around this message instead of at the latest messages; the window holds half a page on each side of it. */
    val anchor: TimelineAnchor? = null,
)
