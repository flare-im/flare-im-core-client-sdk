package com.flare.im.model.query

import com.flare.im.model.common.enums.MessageSearchKind

/** GENERATED. Do not edit by hand. */
/** MessageSearchQuery */
data class MessageSearchQuery(
    /** wire: `conversationId`.  */
    val conversationId: String? = null,
    /** wire: `fromTime`. 起始消息时间（毫秒，含）。 */
    val fromTime: Long? = null,
    /** wire: `includeRecalled`. 默认排除已撤回消息。 */
    val includeRecalled: Boolean = false,
    /** wire: `keyword`.  */
    val keyword: String? = null,
    /** wire: `kinds`.  */
    val kinds: List<MessageSearchKind> = emptyList(),
    /** wire: `limit`.  */
    val limit: Int = 0,
    /** wire: `senderId`.  */
    val senderId: String? = null,
    /** wire: `toTime`. 截止消息时间（毫秒，含）。 */
    val toTime: Long? = null,
)
