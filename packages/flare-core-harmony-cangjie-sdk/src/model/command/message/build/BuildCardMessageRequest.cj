package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a structured card message.
public class BuildCardMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `id`. Card target id.
    public let id: String
    // wire: `cardType`. Optional. Card type key.
    public let cardType: ?String
    // wire: `title`. Optional. Display title.
    public let title: ?String
    // wire: `subtitle`. Optional. Display subtitle.
    public let subtitle: ?String
    // wire: `avatar`. Optional. Avatar URL or media id.
    public let avatar: ?String

    public init(conversationId!: String, id!: String, cardType!: ?String, title!: ?String, subtitle!: ?String, avatar!: ?String) {
        this.conversationId = conversationId
        this.id = id
        this.cardType = cardType
        this.title = title
        this.subtitle = subtitle
        this.avatar = avatar
    }
}
