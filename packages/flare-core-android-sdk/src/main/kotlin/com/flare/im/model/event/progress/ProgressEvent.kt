package com.flare.im.model.event.progress

/** GENERATED. Do not edit by hand. */
/** Generic sync, upload or download progress notification. */
data class ProgressEvent(
    /** wire: `name`. Progress event name. */
    val name: ProgressEventName,
    /** wire: `operation`. Operation being tracked. */
    val operation: String = "",
    /** wire: `current`. Current progress units. */
    val current: Long = 0L,
    /** wire: `total`. Total progress units. */
    val total: Long = 0L,
    /** wire: `taskId`. Task identifier when available. */
    val taskId: String? = null,
    /** wire: `detail`. Human-readable progress detail. */
    val detail: String? = null,
)
