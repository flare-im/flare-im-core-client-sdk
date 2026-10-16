import Foundation

/// GENERATED. Do not edit by hand.
/// ClearPushTokenRequest
public struct ClearPushTokenRequest: Codable, Sendable {
    /// wire: `provider`. Provider whose current desired OS token is invalidated.
    public let provider: String

    public init(provider: String = "") {
        self.provider = provider
    }
}
