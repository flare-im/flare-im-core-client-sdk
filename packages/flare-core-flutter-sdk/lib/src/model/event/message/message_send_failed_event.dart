// GENERATED. Do not edit by hand.
import '../../common/error/sdk_error_payload.dart';

/// Message send failure notification.
final class MessageSendFailedEvent {
  /// wire: `clientMsgId`. Client message id that failed.
  final String clientMsgId;
  /// wire: `reason`. Failure reason.
  final String reason;
  /// wire: `error`. Structured failure details when available.
  final SdkErrorPayload? error;

  const MessageSendFailedEvent({
    this.clientMsgId = '',
    this.reason = '',
    this.error,
  });
}
