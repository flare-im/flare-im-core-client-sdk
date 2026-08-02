import Foundation

/// GENERATED. Do not edit by hand.
/// Build a sticker message.
public struct BuildStickerMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `stickerId`. Sticker id.
    public let stickerId: String
    /// wire: `packageId`. Sticker package id.
    public let packageId: String?
    /// wire: `payload`. Optional sticker payload.
    public let payload: StickerContentPayload?

    public init(conversationId: String = "", stickerId: String = "", packageId: String? = nil, payload: StickerContentPayload? = nil) {
        self.conversationId = conversationId
        self.stickerId = stickerId
        self.packageId = packageId
        self.payload = payload
    }
}
