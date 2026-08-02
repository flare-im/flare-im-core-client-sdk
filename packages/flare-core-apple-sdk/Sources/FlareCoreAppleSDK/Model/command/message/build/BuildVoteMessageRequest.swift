import Foundation

/// GENERATED. Do not edit by hand.
/// Build a vote message.
public struct BuildVoteMessageRequest: Codable, Sendable {
    /// wire: `conversationId`. Target conversation id.
    public let conversationId: String
    /// wire: `voteId`. Vote id.
    public let voteId: String
    /// wire: `title`. Vote title.
    public let title: String
    /// wire: `options`. Vote options.
    public let options: [String]
    /// wire: `participantUserIds`. Participants allowed to vote.
    public let participantUserIds: [String]

    public init(conversationId: String = "", voteId: String = "", title: String = "", options: [String] = [], participantUserIds: [String] = []) {
        self.conversationId = conversationId
        self.voteId = voteId
        self.title = title
        self.options = options
        self.participantUserIds = participantUserIds
    }
}
