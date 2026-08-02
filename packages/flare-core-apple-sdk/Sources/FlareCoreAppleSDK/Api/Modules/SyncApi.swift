import Foundation

/// GENERATED. Do not edit by hand.
/// Explicit sync operations.
public protocol SyncApiProtocol: AnyObject {
    func syncConversationSummaries() async throws -> Void
    func syncConversationSummariesWithVersions(_ request: SyncConversationSummariesRequest) async throws -> SyncConversationSummariesResponse
    func bootstrapStartupHome(_ request: StartupHomeSyncRequest) async throws -> StartupHomeSyncResponse
    func backfillConversationHistory(_ request: ConversationHistoryBackfillRequest) async throws -> ConversationHistoryBackfillResponse
    func syncConversation(_ request: [String: AnySendable]) async throws -> Void
    func syncMessages(_ request: [String: AnySendable]) async throws -> Void
}
