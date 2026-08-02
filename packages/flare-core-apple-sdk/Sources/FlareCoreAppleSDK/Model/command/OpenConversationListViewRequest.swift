import Foundation

/// GENERATED. Do not edit by hand.
/// Request for opening an observable conversation list view.
public struct OpenConversationListViewRequest: Codable, Sendable {
    /// wire: `conversationLimit`. Maximum conversations to include in the initial snapshot.
    public let conversationLimit: UInt32

    public init(conversationLimit: UInt32 = 0) {
        self.conversationLimit = conversationLimit
    }
}
