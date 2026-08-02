package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Conversation listener callbacks.
public interface ConversationEventListener {
    // A new conversation was created or discovered.
    func onNewConversation(event: ConversationEvent): Unit
    // Important conversation fields changed.
    func onConversationChanged(event: ConversationEvent): Unit
    // The total unread message count changed.
    func onTotalUnreadMessageCountChanged(event: ConversationEvent): Unit
    // A conversation was deleted.
    func onConversationDeleted(event: ConversationEvent): Unit
}
