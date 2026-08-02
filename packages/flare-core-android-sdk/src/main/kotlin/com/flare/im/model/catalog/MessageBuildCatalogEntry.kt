package com.flare.im.model.catalog

import com.flare.im.model.common.enums.MessageContentType

/** GENERATED. Do not edit by hand. */
/** One supported quick-build operation exposed on MessageBuilderApi. */
data class MessageBuildCatalogEntry(
    /** wire: `op`. Build dispatch op. */
    val op: MessageBuildOp,
    /** wire: `method`. Facade method name, e.g. buildText. */
    val method: String = "",
    /** wire: `requestType`. Typed request model name. */
    val requestType: String = "",
    /** wire: `contentType`. Decoded content discriminator. */
    val contentType: MessageContentType,
    /** wire: `messageType`. Core message type integer. */
    val messageType: Int = 0,
    /** wire: `summary`. Human-readable summary for UI/docs. */
    val summary: String = "",
    /** wire: `stability`. stable | beta | experimental */
    val stability: String = "",
)
