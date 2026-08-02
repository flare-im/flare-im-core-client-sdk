import Foundation

/// GENERATED. Do not edit by hand.
/// Conversations whose local version is missing or newer than the caller's snapshot.
public struct SyncConversationSummariesResponse: Codable, Sendable {
    /// wire: `changedConversations`. 
    public let changedConversations: [ConversationVersion]

    public init(changedConversations: [ConversationVersion] = []) {
        self.changedConversations = changedConversations
    }
}
