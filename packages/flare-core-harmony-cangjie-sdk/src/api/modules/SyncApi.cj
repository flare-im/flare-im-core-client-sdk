package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Explicit sync operations.
public interface SyncApi {
    func syncConversationSummaries(): Unit
    func syncConversationSummariesWithVersions(request: SyncConversationSummariesRequest): SyncConversationSummariesResponse
    func bootstrapStartupHome(request: StartupHomeSyncRequest): StartupHomeSyncResponse
    func backfillConversationHistory(request: ConversationHistoryBackfillRequest): ConversationHistoryBackfillResponse
    func syncConversation(requestJson: String): Unit
    func syncMessages(requestJson: String): Unit
}
