package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Explicit configuration for generating a Flare IM Core gateway-compatible HS256 access token.
public class CoreTokenRequest {
    // wire: `userId`. Subject user id stored in the JWT sub claim.
    public let userId: String
    // wire: `secret`. HS256 signing secret configured on the gateway verifier.
    public let secret: String
    // wire: `issuer`. JWT issuer expected by the gateway verifier.
    public let issuer: String
    // wire: `ttlSecs`. Token lifetime in seconds.
    public let ttlSecs: UInt64
    // wire: `deviceId`. Optional. Optional device id claim.
    public let deviceId: ?String
    // wire: `tenantId`. Optional. Optional tenant id claim.
    public let tenantId: ?String

    public init(userId!: String, secret!: String, issuer!: String, ttlSecs!: UInt64, deviceId!: ?String, tenantId!: ?String) {
        this.userId = userId
        this.secret = secret
        this.issuer = issuer
        this.ttlSecs = ttlSecs
        this.deviceId = deviceId
        this.tenantId = tenantId
    }
}
