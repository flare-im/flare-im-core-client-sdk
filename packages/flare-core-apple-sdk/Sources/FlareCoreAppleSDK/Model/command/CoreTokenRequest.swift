import Foundation

/// GENERATED. Do not edit by hand.
/// Explicit configuration for generating a Flare IM Core gateway-compatible HS256 access token.
public struct CoreTokenRequest: Codable, Sendable {
    /// wire: `userId`. Subject user id stored in the JWT sub claim.
    public let userId: String
    /// wire: `secret`. HS256 signing secret configured on the gateway verifier.
    public let secret: String
    /// wire: `issuer`. JWT issuer expected by the gateway verifier.
    public let issuer: String
    /// wire: `ttlSecs`. Token lifetime in seconds.
    public let ttlSecs: UInt64
    /// wire: `deviceId`. Optional device id claim.
    public let deviceId: String?
    /// wire: `tenantId`. Optional tenant id claim.
    public let tenantId: String?

    public init(userId: String = "", secret: String = "", issuer: String = "", ttlSecs: UInt64 = 0, deviceId: String? = nil, tenantId: String? = nil) {
        self.userId = userId
        self.secret = secret
        self.issuer = issuer
        self.ttlSecs = ttlSecs
        self.deviceId = deviceId
        self.tenantId = tenantId
    }
}
