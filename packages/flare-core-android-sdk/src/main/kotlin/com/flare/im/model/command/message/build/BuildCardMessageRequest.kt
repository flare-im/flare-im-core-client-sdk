package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a structured card message. */
data class BuildCardMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `id`. Card target id. */
    val id: String = "",
    /** wire: `cardType`. Card type key. */
    val cardType: String? = null,
    /** wire: `title`. Display title. */
    val title: String? = null,
    /** wire: `subtitle`. Display subtitle. */
    val subtitle: String? = null,
    /** wire: `avatar`. Avatar URL or media id. */
    val avatar: String? = null,
)
