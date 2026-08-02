package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a location message.
public class BuildLocationMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `latitude`. Latitude.
    public let latitude: Float64
    // wire: `longitude`. Longitude.
    public let longitude: Float64
    // wire: `title`. Optional. Place title.
    public let title: ?String
    // wire: `address`. Optional. Address.
    public let address: ?String

    public init(conversationId!: String, latitude!: Float64, longitude!: Float64, title!: ?String, address!: ?String) {
        this.conversationId = conversationId
        this.latitude = latitude
        this.longitude = longitude
        this.title = title
        this.address = address
    }
}
