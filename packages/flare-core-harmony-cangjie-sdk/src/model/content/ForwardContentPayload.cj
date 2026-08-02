package flare_core_harmony_cangjie_sdk.model.content

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Forward message payload.
public class ForwardContentPayload {
    // wire: `merge`. Optional. Merge forwarded messages into one card.
    public let merge: ?Bool
    // wire: `title`. Optional. Forward title.
    public let title: ?String
    // wire: `sourceMessages`. Forwarded sources.
    public let sourceMessages: String

    public init(merge!: ?Bool, title!: ?String, sourceMessages!: String) {
        this.merge = merge
        this.title = title
        this.sourceMessages = sourceMessages
    }
}
