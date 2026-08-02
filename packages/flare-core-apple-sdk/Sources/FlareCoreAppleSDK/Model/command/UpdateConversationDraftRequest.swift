import Foundation

/// GENERATED. Do not edit by hand.
/// Typed request for updating the current user's synced conversation draft.
public struct UpdateConversationDraftRequest: Codable, Sendable {
    /// wire: `conversationId`. Conversation id whose draft is being updated.
    public let conversationId: String
    /// wire: `draft`. Draft text. Omit or set null to clear the draft.
    public let draft: String?

    public init(conversationId: String = "", draft: String? = nil) {
        self.conversationId = conversationId
        self.draft = draft
    }
}
