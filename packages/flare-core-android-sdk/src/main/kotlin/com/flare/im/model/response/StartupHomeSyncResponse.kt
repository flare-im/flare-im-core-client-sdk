package com.flare.im.model.response

import com.flare.im.model.entity.HomeTimelineSnapshot

/** GENERATED. Do not edit by hand. */
/** First usable home snapshot plus diagnostics about the startup sync path. */
data class StartupHomeSyncResponse(
    /** wire: `backgroundConvergenceStarted`.  */
    val backgroundConvergenceStarted: Boolean = false,
    /** wire: `coldSyncPerformed`.  */
    val coldSyncPerformed: Boolean = false,
    /** wire: `degradedReason`.  */
    val degradedReason: String? = null,
    /** wire: `servedFromLocal`.  */
    val servedFromLocal: Boolean = false,
    /** wire: `snapshot`.  */
    val snapshot: HomeTimelineSnapshot,
)
