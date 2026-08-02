// GENERATED. Do not edit by hand.
import '../common/enums/message_search_kind.dart';

/// MessageSearchQuery
final class MessageSearchQuery {
  /// wire: `conversationId`. 
  final String? conversationId;
  /// wire: `fromTime`. 起始消息时间（毫秒，含）。
  final int? fromTime;
  /// wire: `includeRecalled`. 默认排除已撤回消息。
  final bool includeRecalled;
  /// wire: `keyword`. 
  final String? keyword;
  /// wire: `kinds`. 
  final List<MessageSearchKind> kinds;
  /// wire: `limit`. 
  final int limit;
  /// wire: `senderId`. 
  final String? senderId;
  /// wire: `toTime`. 截止消息时间（毫秒，含）。
  final int? toTime;

  const MessageSearchQuery({
    this.conversationId,
    this.fromTime,
    this.includeRecalled = false,
    this.keyword,
    this.kinds = const [],
    this.limit = 0,
    this.senderId,
    this.toTime,
  });
}
