// GENERATED. Do not edit by hand.
import '../../response/send_message_response.dart';

/// Message send acknowledgement notification.
final class MessageSendAckEvent {
  /// wire: `ack`. Send acknowledgement.
  final SendMessageResponse ack;

  const MessageSendAckEvent({
    required this.ack,
  });
}
