// GENERATED. Do not edit by hand.

/// MessagePreview
final class MessagePreview {
  /// wire: `messageId`. 
  final String messageId;
  /// wire: `senderId`. 
  final String senderId;
  /// wire: `text`. 
  final String text;
  /// wire: `time`. 毫秒时间戳
  final int time;
  /// wire: `type`. 
  final int type;

  const MessagePreview({
    this.messageId = '',
    this.senderId = '',
    this.text = '',
    this.time = 0,
    this.type = 0,
  });
}
