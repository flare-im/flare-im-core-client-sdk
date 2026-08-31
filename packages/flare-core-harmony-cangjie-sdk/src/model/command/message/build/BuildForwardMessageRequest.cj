package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a forward message.
public class BuildForwardMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `merge`. Optional. Merge into one card.
    public let merge: ?Bool
    // wire: `title`. Forward title.
    public let title: String
    // wire: `sourceMessages`. Messages to forward. Full messages, not id stubs: the forward payload embeds the original content, so the core needs content/senderId/conversationId of each source.
    public let sourceMessages: String

    public init(conversationId!: String, merge!: ?Bool, title!: String, sourceMessages!: String) {
        this.conversationId = conversationId
        this.merge = merge
        this.title = title
        this.sourceMessages = sourceMessages
    }
}
