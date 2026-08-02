// GENERATED. Do not edit by hand.

/// SDK 本地会话参与者快照。单聊不依赖该结构；群聊/频道/客服等非单聊用它支撑群通话、成员面板和后续设置页。
final class ConversationParticipant {
  /// wire: `attributes`. 
  final Map<String, String> attributes;
  /// wire: `joinedAt`. 
  final int joinedAt;
  /// wire: `muted`. 
  final bool muted;
  /// wire: `nickname`. 
  final String nickname;
  /// wire: `pinned`. 
  final bool pinned;
  /// wire: `roles`. 
  final List<String> roles;
  /// wire: `userId`. 
  final String userId;

  const ConversationParticipant({
    this.attributes = const {},
    this.joinedAt = 0,
    this.muted = false,
    this.nickname = '',
    this.pinned = false,
    this.roles = const [],
    this.userId = '',
  });
}
