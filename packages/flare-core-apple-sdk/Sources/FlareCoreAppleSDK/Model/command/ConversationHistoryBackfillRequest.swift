import Foundation

/// GENERATED. Do not edit by hand.
/// Request to backfill one conversation's historical messages into the local store.
public struct ConversationHistoryBackfillRequest: Codable, Sendable {
    /// wire: `conversationId`. Stable conversation id.
    public let conversationId: String
    /// wire: `limit`. Maximum messages per backfill page.
    public let limit: Int32?
    /// wire: `maxPages`. Maximum historical pages to request for this call.
    public let maxPages: UInt32?

    public init(conversationId: String = "", limit: Int32? = nil, maxPages: UInt32? = nil) {
        self.conversationId = conversationId
        self.limit = limit
        self.maxPages = maxPages
    }
}
