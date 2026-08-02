package flare_core_harmony_cangjie_sdk.model.command.message.build

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Build a vote message.
public class BuildVoteMessageRequest {
    // wire: `conversationId`. Target conversation id.
    public let conversationId: String
    // wire: `voteId`. Vote id.
    public let voteId: String
    // wire: `title`. Vote title.
    public let title: String
    // wire: `options`. Vote options.
    public let options: String
    // wire: `participantUserIds`. Participants allowed to vote.
    public let participantUserIds: String

    public init(conversationId!: String, voteId!: String, title!: String, options!: String, participantUserIds!: String) {
        this.conversationId = conversationId
        this.voteId = voteId
        this.title = title
        this.options = options
        this.participantUserIds = participantUserIds
    }
}
