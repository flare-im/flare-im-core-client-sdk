package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a link card message.
public class BuildLinkCardMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `url`. Link URL.
    public let url: String
    // wire: `title`. Optional. Card title.
    public let title: ?String
    // wire: `description`. Optional. Card description.
    public let description: ?String
    // wire: `thumbnailUrl`. Optional. Thumbnail URL.
    public let thumbnailUrl: ?String
    // wire: `siteName`. Optional. Site name.
    public let siteName: ?String

    public init(conversationId!: String, url!: String, title!: ?String, description!: ?String, thumbnailUrl!: ?String, siteName!: ?String) {
        this.conversationId = conversationId
        this.url = url
        this.title = title
        this.description = description
        this.thumbnailUrl = thumbnailUrl
        this.siteName = siteName
    }
}
