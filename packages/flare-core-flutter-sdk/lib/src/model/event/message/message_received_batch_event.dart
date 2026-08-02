// GENERATED. Do not edit by hand.
import '../../entity/message.dart';

/// Batch message received notification.
final class MessageReceivedBatchEvent {
  /// wire: `messages`. Received messages.
  final List<Message> messages;

  const MessageReceivedBatchEvent({
    this.messages = const [],
  });
}
