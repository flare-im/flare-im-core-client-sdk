package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** PushTokenInput */
data class PushTokenInput(
    /** wire: `platform`. Native platform: android, ios or harmony. */
    val platform: String = "",
    /** wire: `provider`. OS delivery provider: fcm, apns or getui. */
    val provider: String = "",
    /** wire: `token`. OS-issued token. Never log or persist outside protected native storage. */
    val token: String = "",
)
