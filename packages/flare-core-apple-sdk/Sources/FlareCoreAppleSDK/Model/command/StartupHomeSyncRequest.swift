import Foundation

/// GENERATED. Do not edit by hand.
/// Core-owned startup sync policy shared by all platform SDKs.
public struct StartupHomeSyncRequest: Codable, Sendable {
    /// wire: `backfillVisibleHistories`. 
    public let backfillVisibleHistories: Bool
    /// wire: `conversationLimit`. 
    public let conversationLimit: UInt32
    /// wire: `historyBackfillLimit`. 
    public let historyBackfillLimit: Int32
    /// wire: `historyBackfillMaxConversations`. 
    public let historyBackfillMaxConversations: UInt32
    /// wire: `historyBackfillMaxPagesPerConversation`. 
    public let historyBackfillMaxPagesPerConversation: UInt32
    /// wire: `startBackgroundConvergence`. 
    public let startBackgroundConvergence: Bool

    public init(backfillVisibleHistories: Bool = false, conversationLimit: UInt32 = 0, historyBackfillLimit: Int32 = 0, historyBackfillMaxConversations: UInt32 = 0, historyBackfillMaxPagesPerConversation: UInt32 = 0, startBackgroundConvergence: Bool = false) {
        self.backfillVisibleHistories = backfillVisibleHistories
        self.conversationLimit = conversationLimit
        self.historyBackfillLimit = historyBackfillLimit
        self.historyBackfillMaxConversations = historyBackfillMaxConversations
        self.historyBackfillMaxPagesPerConversation = historyBackfillMaxPagesPerConversation
        self.startBackgroundConvergence = startBackgroundConvergence
    }
}
