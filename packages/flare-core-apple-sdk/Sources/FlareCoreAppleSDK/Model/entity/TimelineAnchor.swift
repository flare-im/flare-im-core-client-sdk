import Foundation

/// GENERATED. Do not edit by hand.
/// The message a timeline view opens around (a search result, a quote, a pinned message).
public struct TimelineAnchor: Codable, Sendable {
    /// wire: `messageId`. Server id or client id of the target. Its local seq is used when the message is stored locally.
    public let messageId: String?
    /// wire: `seq`. Conversation seq of the target, used when the message is not stored locally. With neither the open fails with sdk.view.anchor_not_found.
    public let seq: UInt64?

    public init(messageId: String? = nil, seq: UInt64? = nil) {
        self.messageId = messageId
        self.seq = seq
    }
}
