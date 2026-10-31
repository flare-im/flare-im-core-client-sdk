package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// The message a timeline view opens around (a search result, a quote, a pinned message).
public class TimelineAnchor {
    // wire: `messageId`. Optional. Server id or client id of the target. Its local seq is used when the message is stored locally.
    public let messageId: ?String
    // wire: `seq`. Optional. Conversation seq of the target, used when the message is not stored locally. With neither the open fails with sdk.view.anchor_not_found.
    public let seq: ?UInt64

    public init(messageId!: ?String, seq!: ?UInt64) {
        this.messageId = messageId
        this.seq = seq
    }
}
