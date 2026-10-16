import Foundation

/// GENERATED. Do not edit by hand.
/// PushTokenInput
public struct PushTokenInput: Codable, Sendable {
    /// wire: `platform`. Native platform: android, ios or harmony.
    public let platform: String
    /// wire: `provider`. OS delivery provider: fcm, apns or getui.
    public let provider: String
    /// wire: `token`. OS-issued token. Never log or persist outside protected native storage.
    public let token: String

    public init(platform: String = "", provider: String = "", token: String = "") {
        self.platform = platform
        self.provider = provider
        self.token = token
    }
}
