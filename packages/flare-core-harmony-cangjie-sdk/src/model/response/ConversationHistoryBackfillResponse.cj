package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Result of direct local-store historical backfill for one conversation.
public class ConversationHistoryBackfillResponse {
    // wire: `conversationId`. Stable conversation id.
    public let conversationId: String
    // wire: `pagesLoaded`. Number of older pages that advanced the local oldest seq.
    public let pagesLoaded: UInt32
    // wire: `oldestSeqBefore`. Oldest local conversation seq before backfill.
    public let oldestSeqBefore: UInt64
    // wire: `oldestSeqAfter`. Oldest local conversation seq after backfill.
    public let oldestSeqAfter: UInt64
    // wire: `hasMore`. Whether the server reported more history remains.
    public let hasMore: Bool
    // wire: `completed`. True when this call reached the earliest visible history or the server reported no more pages.
    public let completed: Bool

    public init(conversationId!: String, pagesLoaded!: UInt32, oldestSeqBefore!: UInt64, oldestSeqAfter!: UInt64, hasMore!: Bool, completed!: Bool) {
        this.conversationId = conversationId
        this.pagesLoaded = pagesLoaded
        this.oldestSeqBefore = oldestSeqBefore
        this.oldestSeqAfter = oldestSeqAfter
        this.hasMore = hasMore
        this.completed = completed
    }
}
