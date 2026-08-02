import Foundation

/// GENERATED. Do not edit by hand.
/// Generated core access token payload.
public struct CoreTokenResponse: Codable, Sendable {
    /// wire: `token`. Signed JWT access token.
    public let token: String

    public init(token: String = "") {
        self.token = token
    }
}
