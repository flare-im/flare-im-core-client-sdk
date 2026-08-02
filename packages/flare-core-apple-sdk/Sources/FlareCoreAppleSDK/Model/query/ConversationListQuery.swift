import Foundation

/// GENERATED. Do not edit by hand.
/// ConversationListQuery
public struct ConversationListQuery: Codable, Sendable {
    /// wire: `conversationTypes`. 
    public let conversationTypes: [ConversationType]
    /// wire: `cursor`. cursor 为会话 ID，表示从该会话之后开始。
    public let cursor: String?
    /// wire: `hasDraftOnly`. 
    public let hasDraftOnly: Bool
    /// wire: `hasMarkedMessages`. 标记消息所在会话。core 当前没有“会话标签”模型，因此只支持消息标记聚合。
    public let hasMarkedMessages: Bool
    /// wire: `includeArchived`. 
    public let includeArchived: Bool
    /// wire: `keyword`. 
    public let keyword: String?
    /// wire: `limit`. 
    public let limit: UInt32?
    /// wire: `mentionMeOnly`. 
    public let mentionMeOnly: Bool
    /// wire: `mutedOnly`. 
    public let mutedOnly: Bool?
    /// wire: `pinnedOnly`. 
    public let pinnedOnly: Bool
    /// wire: `unreadOnly`. 
    public let unreadOnly: Bool

    public init(conversationTypes: [ConversationType] = [], cursor: String? = nil, hasDraftOnly: Bool = false, hasMarkedMessages: Bool = false, includeArchived: Bool = false, keyword: String? = nil, limit: UInt32? = nil, mentionMeOnly: Bool = false, mutedOnly: Bool? = nil, pinnedOnly: Bool = false, unreadOnly: Bool = false) {
        self.conversationTypes = conversationTypes
        self.cursor = cursor
        self.hasDraftOnly = hasDraftOnly
        self.hasMarkedMessages = hasMarkedMessages
        self.includeArchived = includeArchived
        self.keyword = keyword
        self.limit = limit
        self.mentionMeOnly = mentionMeOnly
        self.mutedOnly = mutedOnly
        self.pinnedOnly = pinnedOnly
        self.unreadOnly = unreadOnly
    }
}
