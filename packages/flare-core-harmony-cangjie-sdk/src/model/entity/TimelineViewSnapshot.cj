package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// The window of a timeline view: rows in timeline order and where it stands.
public class TimelineViewSnapshot {
    // wire: `conversation`. Optional. Conversation header.
    public let conversation: ?Conversation
    // wire: `messages`. Rows in timeline order (oldest first); pending rows trail when the window is attached to the latest.
    public let messages: String
    // wire: `hasOlder`. More visible messages exist below the oldest row; answered by the proven seq ranges only.
    public let hasOlder: Bool
    // wire: `hasNewer`. More messages exist above the newest row; true exactly when attachedToLatest is false.
    public let hasNewer: Bool
    // wire: `attachedToLatest`. The newest row is the latest local message and live messages are appended.
    public let attachedToLatest: Bool
    // wire: `anchorKey`. Optional. Row key of the target when the view was opened around a message.
    public let anchorKey: ?String

    public init(conversation!: ?Conversation, messages!: String, hasOlder!: Bool, hasNewer!: Bool, attachedToLatest!: Bool, anchorKey!: ?String) {
        this.conversation = conversation
        this.messages = messages
        this.hasOlder = hasOlder
        this.hasNewer = hasNewer
        this.attachedToLatest = attachedToLatest
        this.anchorKey = anchorKey
    }
}
