// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// Message listener callbacks.
abstract class MessageEventListener {
  const MessageEventListener();
  /// A single message was received.
  void onMessageReceived(MessageReceivedEvent event) {}
  /// A batch of messages was received.
  void onMessageReceivedBatch(MessageReceivedBatchEvent event) {}
  /// A message send operation was acknowledged.
  void onMessageSendAck(MessageSendAckEvent event) {}
  /// A message send operation failed.
  void onMessageSendFailed(MessageSendFailedEvent event) {}
  /// A message was recalled.
  void onMessageRecalled(MessageMutationEvent event) {}
  /// A message was edited.
  void onMessageEdited(MessageMutationEvent event) {}
  /// A message was deleted.
  void onMessageDeleted(MessageMutationEvent event) {}
  /// A message read receipt changed.
  void onMessageReadReceipt(ReadReceiptEvent event) {}
  /// A message reaction changed.
  void onMessageReactionChanged(ReactionChangedEvent event) {}
  /// A conversation input or typing status changed.
  void onInputStatusChanged(TypingEvent event) {}
  /// Aggregated typing status changed for a large conversation.
  void onTypingAggregateChanged(TypingAggregateEvent event) {}
  /// A burn-after-read message was burned.
  void onMessageBurned(MessageMutationEvent event) {}
  /// A message was pinned.
  void onMessagePinned(MessageMutationEvent event) {}
  /// A message was unpinned.
  void onMessageUnpinned(MessageMutationEvent event) {}
}
