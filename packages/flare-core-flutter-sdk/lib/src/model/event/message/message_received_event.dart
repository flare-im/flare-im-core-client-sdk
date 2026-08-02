// GENERATED. Do not edit by hand.
import '../../entity/message.dart';

/// Single message received notification.
final class MessageReceivedEvent {
  /// wire: `message`. Received message.
  final Message message;

  const MessageReceivedEvent({
    required this.message,
  });
}
