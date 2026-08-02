package com.flare.im.model.event.sync

import com.flare.im.model.common.error.SdkErrorPayload

/** GENERATED. Do not edit by hand. */
/** Sync orchestration notification payload. */
data class SyncEvent(
    /** wire: `name`. Sync event name. */
    val name: SyncEventName,
    /** wire: `runId`. Stable sync run id used to correlate readiness, progress, and completion. */
    val runId: String? = null,
    /** wire: `trigger`. Sync trigger. */
    val trigger: String? = null,
    /** wire: `scope`. Sync scope. */
    val scope: String? = null,
    /** wire: `visibility`. Sync visibility policy. */
    val visibility: String? = null,
    /** wire: `reason`. Sync reason for diagnostics and startup wait reports. */
    val reason: String? = null,
    /** wire: `phase`. Sync phase. */
    val phase: String? = null,
    /** wire: `task`. Sync task name. */
    val task: String? = null,
    /** wire: `stage`. Readiness stage for sync.readiness events. */
    val stage: String? = null,
    /** wire: `progress`. Progress percentage from 0 to 100. */
    val progress: Int? = null,
    /** wire: `error`. Failure details for failed sync events. */
    val error: SdkErrorPayload? = null,
)
