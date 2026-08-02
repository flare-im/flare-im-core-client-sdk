import Foundation

/// GENERATED. Do not edit by hand.
// Models: SyncConversationSummariesRequest, SyncConversationSummariesResponse
public final class DefaultSyncApi: SyncApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func syncConversationSummaries() async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.syncConversationSummaries, request: nil)
    }

    public func syncConversationSummariesWithVersions(_ request: SyncConversationSummariesRequest) async throws -> SyncConversationSummariesResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.syncConversationSummariesWithVersions, request: unwrapRequest(AnySendable(syncConversationSummariesRequestToMap(request))))
        return try syncConversationSummariesResponseFromJson(raw)
    }

    public func bootstrapStartupHome(_ request: StartupHomeSyncRequest) async throws -> StartupHomeSyncResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.syncBootstrapStartupHome, request: unwrapRequest(AnySendable(startupHomeSyncRequestToMap(request))))
        return try startupHomeSyncResponseFromJson(raw)
    }

    public func backfillConversationHistory(_ request: ConversationHistoryBackfillRequest) async throws -> ConversationHistoryBackfillResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.syncConversationHistoryBackfill, request: unwrapRequest(AnySendable(conversationHistoryBackfillRequestToMap(request))))
        return try conversationHistoryBackfillResponseFromJson(raw)
    }

    public func syncConversation(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.syncConversation, request: AnySendable(request))
    }

    public func syncMessages(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.syncMessages, request: AnySendable(request))
    }


}
