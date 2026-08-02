package flare_core_harmony_cangjie_sdk.model.query

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// ConversationListQuery
public class ConversationListQuery {
    // wire: `conversationTypes`. 
    public let conversationTypes: String
    // wire: `cursor`. Optional. cursor 为会话 ID，表示从该会话之后开始。
    public let cursor: ?String
    // wire: `hasDraftOnly`. 
    public let hasDraftOnly: Bool
    // wire: `hasMarkedMessages`. 标记消息所在会话。core 当前没有“会话标签”模型，因此只支持消息标记聚合。
    public let hasMarkedMessages: Bool
    // wire: `includeArchived`. 
    public let includeArchived: Bool
    // wire: `keyword`. Optional. 
    public let keyword: ?String
    // wire: `limit`. Optional. 
    public let limit: ?UInt32
    // wire: `mentionMeOnly`. 
    public let mentionMeOnly: Bool
    // wire: `mutedOnly`. Optional. 
    public let mutedOnly: ?Bool
    // wire: `pinnedOnly`. 
    public let pinnedOnly: Bool
    // wire: `unreadOnly`. 
    public let unreadOnly: Bool

    public init(conversationTypes!: String, cursor!: ?String, hasDraftOnly!: Bool, hasMarkedMessages!: Bool, includeArchived!: Bool, keyword!: ?String, limit!: ?UInt32, mentionMeOnly!: Bool, mutedOnly!: ?Bool, pinnedOnly!: Bool, unreadOnly!: Bool) {
        this.conversationTypes = conversationTypes
        this.cursor = cursor
        this.hasDraftOnly = hasDraftOnly
        this.hasMarkedMessages = hasMarkedMessages
        this.includeArchived = includeArchived
        this.keyword = keyword
        this.limit = limit
        this.mentionMeOnly = mentionMeOnly
        this.mutedOnly = mutedOnly
        this.pinnedOnly = pinnedOnly
        this.unreadOnly = unreadOnly
    }
}
