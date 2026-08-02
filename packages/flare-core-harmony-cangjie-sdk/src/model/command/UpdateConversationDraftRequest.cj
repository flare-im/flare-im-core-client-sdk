package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Typed request for updating the current user's synced conversation draft.
public class UpdateConversationDraftRequest {
    // wire: `conversationId`. Conversation id whose draft is being updated.
    public let conversationId: String
    // wire: `draft`. Optional. Draft text. Omit or set null to clear the draft.
    public let draft: ?String

    public init(conversationId!: String, draft!: ?String) {
        this.conversationId = conversationId
        this.draft = draft
    }
}
