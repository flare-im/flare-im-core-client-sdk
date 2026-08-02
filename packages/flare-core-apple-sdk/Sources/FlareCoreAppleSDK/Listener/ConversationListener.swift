import Foundation

/// GENERATED. Do not edit by hand.
/// Conversation listener callbacks.
public protocol ConversationEventListener: AnyObject {
    /// A new conversation was created or discovered.
    func onNewConversation(_ event: ConversationEvent)
    /// Important conversation fields changed.
    func onConversationChanged(_ event: ConversationEvent)
    /// The total unread message count changed.
    func onTotalUnreadMessageCountChanged(_ event: ConversationEvent)
    /// A conversation was deleted.
    func onConversationDeleted(_ event: ConversationEvent)
}

public extension ConversationEventListener {
    func onNewConversation(_ event: ConversationEvent) {}
    func onConversationChanged(_ event: ConversationEvent) {}
    func onTotalUnreadMessageCountChanged(_ event: ConversationEvent) {}
    func onConversationDeleted(_ event: ConversationEvent) {}
}
