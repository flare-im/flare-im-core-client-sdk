// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// Direct callback for `messages.sendMessage(request, callback)` progress and terminal states.
abstract class MessageSendCallback {
  const MessageSendCallback();
  /// Message upload or send progress changed.
  void onProgress(ProgressEvent event) {}
  /// Message send completed successfully.
  void onSuccess(MessageSendAckEvent event) {}
  /// Message send failed.
  void onFailure(MessageSendFailedEvent event) {}
}
