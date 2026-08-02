package flare_core_harmony_cangjie_sdk.model.event.presence

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Presence notification payload.
public class PresenceChangedEvent {
    // wire: `conversationId`. Optional. Conversation id when presence is scoped to a conversation.
    public let conversationId: ?String
    // wire: `userId`. User id.
    public let userId: String
    // wire: `status`. Presence status.
    public let status: String
    // wire: `extra`. Opaque presence details.
    public let extra: String

    public init(conversationId!: ?String, userId!: String, status!: String, extra!: String) {
        this.conversationId = conversationId
        this.userId = userId
        this.status = status
        this.extra = extra
    }
}
