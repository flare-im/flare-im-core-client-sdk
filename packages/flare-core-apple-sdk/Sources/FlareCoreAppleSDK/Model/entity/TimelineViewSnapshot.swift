import Foundation

/// GENERATED. Do not edit by hand.
/// The window of a timeline view: rows in timeline order and where it stands.
public struct TimelineViewSnapshot: Sendable {
    /// wire: `conversation`. Conversation header.
    public let conversation: Conversation?
    /// wire: `messages`. Rows in timeline order (oldest first); pending rows trail when the window is attached to the latest.
    public let messages: [Message]
    /// wire: `hasOlder`. More visible messages exist below the oldest row; answered by the proven seq ranges only.
    public let hasOlder: Bool
    /// wire: `hasNewer`. More messages exist above the newest row; true exactly when attachedToLatest is false.
    public let hasNewer: Bool
    /// wire: `attachedToLatest`. The newest row is the latest local message and live messages are appended.
    public let attachedToLatest: Bool
    /// wire: `anchorKey`. Row key of the target when the view was opened around a message.
    public let anchorKey: String?

    public init(conversation: Conversation? = nil, messages: [Message] = [], hasOlder: Bool = false, hasNewer: Bool = false, attachedToLatest: Bool = false, anchorKey: String? = nil) {
        self.conversation = conversation
        self.messages = messages
        self.hasOlder = hasOlder
        self.hasNewer = hasNewer
        self.attachedToLatest = attachedToLatest
        self.anchorKey = anchorKey
    }
}
