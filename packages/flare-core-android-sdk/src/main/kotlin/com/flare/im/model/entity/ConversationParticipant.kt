package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** SDK 本地会话参与者快照。单聊不依赖该结构；群聊/频道/客服等非单聊用它支撑群通话、成员面板和后续设置页。 */
data class ConversationParticipant(
    /** wire: `attributes`.  */
    val attributes: Map<String, String> = emptyMap(),
    /** wire: `joinedAt`.  */
    val joinedAt: Long = 0L,
    /** wire: `muted`.  */
    val muted: Boolean = false,
    /** wire: `nickname`.  */
    val nickname: String = "",
    /** wire: `pinned`.  */
    val pinned: Boolean = false,
    /** wire: `roles`.  */
    val roles: List<String> = emptyList(),
    /** wire: `userId`.  */
    val userId: String = "",
)
