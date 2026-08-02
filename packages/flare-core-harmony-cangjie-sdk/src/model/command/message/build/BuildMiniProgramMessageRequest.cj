package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a mini program message.
public class BuildMiniProgramMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `appId`. Mini program app id.
    public let appId: String
    // wire: `pagePath`. Optional. Entry path.
    public let pagePath: ?String
    // wire: `title`. Optional. Display title.
    public let title: ?String
    // wire: `thumbnailUrl`. Optional. Thumbnail URL.
    public let thumbnailUrl: ?String
    // wire: `extra`. Optional. Mini program extension fields.
    public let extra: ?String

    public init(conversationId!: String, appId!: String, pagePath!: ?String, title!: ?String, thumbnailUrl!: ?String, extra!: ?String) {
        this.conversationId = conversationId
        this.appId = appId
        this.pagePath = pagePath
        this.title = title
        this.thumbnailUrl = thumbnailUrl
        this.extra = extra
    }
}
