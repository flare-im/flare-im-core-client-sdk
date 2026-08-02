package flare_core_harmony_cangjie_sdk.model.content

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// One source message inside a forward bundle.
public class ForwardSourceMessage {
    // wire: `sourceMessageId`. Original message id.
    public let sourceMessageId: String
    // wire: `sourceConversationId`. Optional. Original conversation id.
    public let sourceConversationId: ?String
    // wire: `sourceSenderId`. Optional. Original sender id.
    public let sourceSenderId: ?String
    // wire: `plainText`. Optional. Preview text.
    public let plainText: ?String

    public init(sourceMessageId!: String, sourceConversationId!: ?String, sourceSenderId!: ?String, plainText!: ?String) {
        this.sourceMessageId = sourceMessageId
        this.sourceConversationId = sourceConversationId
        this.sourceSenderId = sourceSenderId
        this.plainText = plainText
    }
}
