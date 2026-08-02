package com.flare.im.model.command

import com.flare.im.model.entity.ConversationVersion

/** GENERATED. Do not edit by hand. */
/** Request for summary sync with client-known conversation versions. */
data class SyncConversationSummariesRequest(
    /** wire: `knownVersions`.  */
    val knownVersions: List<ConversationVersion> = emptyList(),
)
