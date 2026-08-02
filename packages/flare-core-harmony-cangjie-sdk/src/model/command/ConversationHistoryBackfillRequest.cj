package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request to backfill one conversation's historical messages into the local store.
public class ConversationHistoryBackfillRequest {
    // wire: `conversationId`. Stable conversation id.
    public let conversationId: String
    // wire: `limit`. Optional. Maximum messages per backfill page.
    public let limit: ?Int32
    // wire: `maxPages`. Optional. Maximum historical pages to request for this call.
    public let maxPages: ?UInt32

    public init(conversationId!: String, limit!: ?Int32, maxPages!: ?UInt32) {
        this.conversationId = conversationId
        this.limit = limit
        this.maxPages = maxPages
    }
}
