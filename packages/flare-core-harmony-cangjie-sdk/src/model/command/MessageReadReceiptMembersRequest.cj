package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// One page of the members who read, or have not yet read, one of the viewer's own group messages (the read receipt sheet).
public class MessageReadReceiptMembersRequest {
    // wire: `payload`. {conversationId, serverMsgId, state: "read" | "unread", cursor?, limit?}; limit 1..=200 (default 50), cursor the previous page's nextCursor (absent for the first page).
    public let payload: String

    public init(payload!: String) {
        this.payload = payload
    }
}
