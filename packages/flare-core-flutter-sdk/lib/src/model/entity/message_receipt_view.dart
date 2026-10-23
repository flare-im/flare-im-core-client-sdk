// GENERATED. Do not edit by hand.
import 'message_read_summary.dart';
import 'message_receipt_status.dart';

/// The receipt projection of a message, computed by the core SDK; kits draw it as is (no host mapping from status, isRead or localState). Incoming messages carry one too, kits show no receipt for them.
final class MessageReceiptView {
  /// wire: `status`. Receipt state.
  final MessageReceiptStatus status;
  /// wire: `readSummary`. Only on the viewer's own messages in groups, once the core SDK has read it from Core for a message a view shows (and refreshed on read receipts); absent in single chats, in groups above the large-group threshold, and before it is known. Never a made-up number.
  final MessageReadSummary? readSummary;

  const MessageReceiptView({
    required this.status,
    this.readSummary,
  });
}
