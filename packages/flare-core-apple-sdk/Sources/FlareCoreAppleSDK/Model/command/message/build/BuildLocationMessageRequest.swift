import Foundation

/// GENERATED. Do not edit by hand.
/// Build a location message.
public struct BuildLocationMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `latitude`. Latitude.
    public let latitude: Double
    /// wire: `longitude`. Longitude.
    public let longitude: Double
    /// wire: `title`. Place title.
    public let title: String?
    /// wire: `address`. Address.
    public let address: String?

    public init(conversationId: String = "", latitude: Double = 0.0, longitude: Double = 0.0, title: String? = nil, address: String? = nil) {
        self.conversationId = conversationId
        self.latitude = latitude
        self.longitude = longitude
        self.title = title
        self.address = address
    }
}
