package com.flare.im.model.command.message.build

/** GENERATED. Do not edit by hand. */
/** Build a location message. */
data class BuildLocationMessageRequest(
    /** wire: `conversationId`. Target conversation id. */
    val conversationId: String = "",
    /** wire: `latitude`. Latitude. */
    val latitude: Double = 0.0,
    /** wire: `longitude`. Longitude. */
    val longitude: Double = 0.0,
    /** wire: `title`. Place title. */
    val title: String? = null,
    /** wire: `address`. Address. */
    val address: String? = null,
)
