import Foundation

/// GENERATED. Do not edit by hand.
/// Request for opening an observable conversation timeline view.
public struct OpenTimelineViewRequest: Codable, Sendable {
    /// wire: `conversationId`. Conversation id to observe.
    public let conversationId: String
    /// wire: `messageLimit`. Maximum messages to include in the initial snapshot.
    public let messageLimit: UInt32

    public init(conversationId: String = "", messageLimit: UInt32 = 0) {
        self.conversationId = conversationId
        self.messageLimit = messageLimit
    }
}
