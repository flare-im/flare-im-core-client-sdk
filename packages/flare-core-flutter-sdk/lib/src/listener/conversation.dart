// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// Conversation listener callbacks.
abstract class ConversationEventListener {
  const ConversationEventListener();
  /// A new conversation was created or discovered.
  void onNewConversation(ConversationEvent event) {}
  /// Important conversation fields changed.
  void onConversationChanged(ConversationEvent event) {}
  /// The total unread message count changed.
  void onTotalUnreadMessageCountChanged(ConversationEvent event) {}
  /// A conversation was deleted.
  void onConversationDeleted(ConversationEvent event) {}
}
