// GENERATED. Do not edit by hand.

/** SDK 本地会话参与者快照。单聊不依赖该结构；群聊/频道/客服等非单聊用它支撑群通话、成员面板和后续设置页。 */
export interface ConversationParticipant {
  /** wire: `attributes`.  */
  attributes: Record<string, string>;
  /** wire: `joinedAt`.  */
  joinedAt: number;
  /** wire: `muted`.  */
  muted: boolean;
  /** wire: `nickname`.  */
  nickname: string;
  /** wire: `pinned`.  */
  pinned: boolean;
  /** wire: `roles`.  */
  roles: Array<string>;
  /** wire: `userId`.  */
  userId: string;
}
