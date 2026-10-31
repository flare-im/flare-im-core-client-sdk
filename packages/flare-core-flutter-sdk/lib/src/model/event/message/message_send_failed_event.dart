// GENERATED. Do not edit by hand.
import '../../common/error/sdk_error_payload.dart';

/// Message send failure notification.
final class MessageSendFailedEvent {
  /// wire: `clientMsgId`. Client message id that failed.
  final String clientMsgId;
  /// wire: `reason`. Failure reason text for people; use error.code and error.machineReason to act on it.
  final String reason;
  /// wire: `error`. Structured failure: code, machineReason (ErrorDetail.reason when the server rejected), message, operation, retryable, details.
  final SdkErrorPayload? error;

  const MessageSendFailedEvent({
    this.clientMsgId = '',
    this.reason = '',
    this.error,
  });
}
