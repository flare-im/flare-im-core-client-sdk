// GENERATED. Do not edit by hand.
import '../../../entity/message_content.dart';

/// Build a quote/reply message.
final class BuildQuoteMessageRequest {
  /// wire: `conversationId`. Target conversation id.
  final String conversationId;
  /// wire: `quotedMessageId`. Quoted message id.
  final String quotedMessageId;
  /// wire: `text`. Reply text.
  final String text;
  /// wire: `quotedSenderId`. Quoted sender id.
  final String? quotedSenderId;
  /// wire: `quotedTextPreview`. Quoted preview text.
  final String? quotedTextPreview;
  /// wire: `quotedContent`. Quoted message content element.
  final MessageContent quotedContent;

  const BuildQuoteMessageRequest({
    this.conversationId = '',
    this.quotedMessageId = '',
    this.text = '',
    this.quotedSenderId,
    this.quotedTextPreview,
    required this.quotedContent,
  });
}
