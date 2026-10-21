// GENERATED. Do not edit by hand.
import '../../entity/message.dart';

/// Send a fully built message.
final class SendMessageRequest {
  /// wire: `message`. Message to send.
  final Message message;
  /// wire: `expectedUserId`. Optional active-user precondition; cannot override the authenticated sender.
  final String? expectedUserId;

  const SendMessageRequest({
    required this.message,
    this.expectedUserId,
  });
}
