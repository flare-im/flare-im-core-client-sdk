import Foundation

/// GENERATED. Do not edit by hand.
/// HomeTimelineSnapshot
public struct HomeTimelineSnapshot: Codable, Sendable {
    /// wire: `conversations`. 
    public let conversations: [Conversation]
    /// wire: `syncState`. 
    public let syncState: TimelineSyncState
    /// wire: `totalUnread`. 
    public let totalUnread: UInt64

    public init(conversations: [Conversation] = [], syncState: TimelineSyncState, totalUnread: UInt64 = 0) {
        self.conversations = conversations
        self.syncState = syncState
        self.totalUnread = totalUnread
    }
}
