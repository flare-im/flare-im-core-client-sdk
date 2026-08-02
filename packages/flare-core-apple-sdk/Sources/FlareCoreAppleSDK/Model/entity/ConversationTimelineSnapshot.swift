import Foundation

/// GENERATED. Do not edit by hand.
/// ConversationTimelineSnapshot
public struct ConversationTimelineSnapshot: Sendable {
    /// wire: `conversation`. 
    public let conversation: Conversation?
    /// wire: `hasMore`. 
    public let hasMore: Bool
    /// wire: `messages`. 
    public let messages: [Message]

    public init(conversation: Conversation? = nil, hasMore: Bool = false, messages: [Message] = []) {
        self.conversation = conversation
        self.hasMore = hasMore
        self.messages = messages
    }
}
