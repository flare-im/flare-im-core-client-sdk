package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** MessagePreview */
data class MessagePreview(
    /** wire: `messageId`.  */
    val messageId: String = "",
    /** wire: `senderId`.  */
    val senderId: String = "",
    /** wire: `text`.  */
    val text: String = "",
    /** wire: `time`. 毫秒时间戳 */
    val time: Long = 0L,
    /** wire: `type`.  */
    val type: Int = 0,
)
