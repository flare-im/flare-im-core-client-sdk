package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// PushTokenInput
public class PushTokenInput {
    // wire: `platform`. Native platform: android, ios or harmony.
    public let platform: String
    // wire: `provider`. OS delivery provider: fcm, apns or getui.
    public let provider: String
    // wire: `token`. OS-issued token. Never log or persist outside protected native storage.
    public let token: String

    public init(platform!: String, provider!: String, token!: String) {
        this.platform = platform
        this.provider = provider
        this.token = token
    }
}
