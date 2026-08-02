// GENERATED. Do not edit by hand.
import '../common/enums/conversation_type.dart';

/// ConversationListQuery
final class ConversationListQuery {
  /// wire: `conversationTypes`. 
  final List<ConversationType> conversationTypes;
  /// wire: `cursor`. cursor 为会话 ID，表示从该会话之后开始。
  final String? cursor;
  /// wire: `hasDraftOnly`. 
  final bool hasDraftOnly;
  /// wire: `hasMarkedMessages`. 标记消息所在会话。core 当前没有“会话标签”模型，因此只支持消息标记聚合。
  final bool hasMarkedMessages;
  /// wire: `includeArchived`. 
  final bool includeArchived;
  /// wire: `keyword`. 
  final String? keyword;
  /// wire: `limit`. 
  final int? limit;
  /// wire: `mentionMeOnly`. 
  final bool mentionMeOnly;
  /// wire: `mutedOnly`. 
  final bool? mutedOnly;
  /// wire: `pinnedOnly`. 
  final bool pinnedOnly;
  /// wire: `unreadOnly`. 
  final bool unreadOnly;

  const ConversationListQuery({
    this.conversationTypes = const [],
    this.cursor,
    this.hasDraftOnly = false,
    this.hasMarkedMessages = false,
    this.includeArchived = false,
    this.keyword,
    this.limit,
    this.mentionMeOnly = false,
    this.mutedOnly,
    this.pinnedOnly = false,
    this.unreadOnly = false,
  });
}
