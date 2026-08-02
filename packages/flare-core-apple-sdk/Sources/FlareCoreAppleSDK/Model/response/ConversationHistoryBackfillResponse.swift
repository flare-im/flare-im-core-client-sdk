import Foundation

/// GENERATED. Do not edit by hand.
/// Result of direct local-store historical backfill for one conversation.
public struct ConversationHistoryBackfillResponse: Codable, Sendable {
    /// wire: `conversationId`. Stable conversation id.
    public let conversationId: String
    /// wire: `pagesLoaded`. Number of older pages that advanced the local oldest seq.
    public let pagesLoaded: UInt32
    /// wire: `oldestSeqBefore`. Oldest local conversation seq before backfill.
    public let oldestSeqBefore: UInt64
    /// wire: `oldestSeqAfter`. Oldest local conversation seq after backfill.
    public let oldestSeqAfter: UInt64
    /// wire: `hasMore`. Whether the server reported more history remains.
    public let hasMore: Bool
    /// wire: `completed`. True when this call reached the earliest visible history or the server reported no more pages.
    public let completed: Bool

    public init(conversationId: String = "", pagesLoaded: UInt32 = 0, oldestSeqBefore: UInt64 = 0, oldestSeqAfter: UInt64 = 0, hasMore: Bool = false, completed: Bool = false) {
        self.conversationId = conversationId
        self.pagesLoaded = pagesLoaded
        self.oldestSeqBefore = oldestSeqBefore
        self.oldestSeqAfter = oldestSeqAfter
        self.hasMore = hasMore
        self.completed = completed
    }
}
