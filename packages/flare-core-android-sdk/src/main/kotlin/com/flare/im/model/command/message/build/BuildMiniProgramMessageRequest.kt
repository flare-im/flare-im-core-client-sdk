package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a mini program message. */
data class BuildMiniProgramMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `appId`. Mini program app id. */
    val appId: String = "",
    /** wire: `pagePath`. Entry path. */
    val pagePath: String? = null,
    /** wire: `title`. Display title. */
    val title: String? = null,
    /** wire: `thumbnailUrl`. Thumbnail URL. */
    val thumbnailUrl: String? = null,
    /** wire: `extra`. Mini program extension fields. */
    val extra: Map<String, String>? = null,
)
