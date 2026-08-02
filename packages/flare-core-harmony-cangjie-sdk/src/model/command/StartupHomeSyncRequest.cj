package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Core-owned startup sync policy shared by all platform SDKs.
public class StartupHomeSyncRequest {
    // wire: `backfillVisibleHistories`. 
    public let backfillVisibleHistories: Bool
    // wire: `conversationLimit`. 
    public let conversationLimit: UInt32
    // wire: `historyBackfillLimit`. 
    public let historyBackfillLimit: Int32
    // wire: `historyBackfillMaxConversations`. 
    public let historyBackfillMaxConversations: UInt32
    // wire: `historyBackfillMaxPagesPerConversation`. 
    public let historyBackfillMaxPagesPerConversation: UInt32
    // wire: `startBackgroundConvergence`. 
    public let startBackgroundConvergence: Bool

    public init(backfillVisibleHistories!: Bool, conversationLimit!: UInt32, historyBackfillLimit!: Int32, historyBackfillMaxConversations!: UInt32, historyBackfillMaxPagesPerConversation!: UInt32, startBackgroundConvergence!: Bool) {
        this.backfillVisibleHistories = backfillVisibleHistories
        this.conversationLimit = conversationLimit
        this.historyBackfillLimit = historyBackfillLimit
        this.historyBackfillMaxConversations = historyBackfillMaxConversations
        this.historyBackfillMaxPagesPerConversation = historyBackfillMaxPagesPerConversation
        this.startBackgroundConvergence = startBackgroundConvergence
    }
}
