package com.flare.im.model.command

/** GENERATED. Do not edit by hand. */
/** Explicit configuration for generating a Flare IM Core gateway-compatible HS256 access token. */
data class CoreTokenRequest(
    /** wire: `userId`. Subject user id stored in the JWT sub claim. */
    val userId: String = "",
    /** wire: `secret`. HS256 signing secret configured on the gateway verifier. */
    val secret: String = "",
    /** wire: `issuer`. JWT issuer expected by the gateway verifier. */
    val issuer: String = "",
    /** wire: `ttlSecs`. Token lifetime in seconds. */
    val ttlSecs: Long = 0L,
    /** wire: `deviceId`. Optional device id claim. */
    val deviceId: String? = null,
    /** wire: `tenantId`. Optional tenant id claim. */
    val tenantId: String? = null,
)
