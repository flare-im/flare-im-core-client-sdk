package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a link card message. */
data class BuildLinkCardMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `url`. Link URL. */
    val url: String = "",
    /** wire: `title`. Card title. */
    val title: String? = null,
    /** wire: `description`. Card description. */
    val description: String? = null,
    /** wire: `thumbnailUrl`. Thumbnail URL. */
    val thumbnailUrl: String? = null,
    /** wire: `siteName`. Site name. */
    val siteName: String? = null,
)
