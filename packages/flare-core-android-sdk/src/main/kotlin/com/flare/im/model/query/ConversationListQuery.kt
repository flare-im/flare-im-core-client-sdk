package com.flare.im.model.query

import com.flare.im.model.common.enums.ConversationType

/** GENERATED. Do not edit by hand. */
/** ConversationListQuery */
data class ConversationListQuery(
    /** wire: `conversationTypes`.  */
    val conversationTypes: List<ConversationType> = emptyList(),
    /** wire: `cursor`. cursor 为会话 ID，表示从该会话之后开始。 */
    val cursor: String? = null,
    /** wire: `hasDraftOnly`.  */
    val hasDraftOnly: Boolean = false,
    /** wire: `hasMarkedMessages`. 标记消息所在会话。core 当前没有“会话标签”模型，因此只支持消息标记聚合。 */
    val hasMarkedMessages: Boolean = false,
    /** wire: `includeArchived`.  */
    val includeArchived: Boolean = false,
    /** wire: `keyword`.  */
    val keyword: String? = null,
    /** wire: `limit`.  */
    val limit: Int? = null,
    /** wire: `mentionMeOnly`.  */
    val mentionMeOnly: Boolean = false,
    /** wire: `mutedOnly`.  */
    val mutedOnly: Boolean? = null,
    /** wire: `pinnedOnly`.  */
    val pinnedOnly: Boolean = false,
    /** wire: `unreadOnly`.  */
    val unreadOnly: Boolean = false,
)
