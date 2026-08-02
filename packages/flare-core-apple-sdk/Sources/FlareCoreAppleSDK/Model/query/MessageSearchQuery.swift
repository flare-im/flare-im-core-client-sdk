import Foundation

/// GENERATED. Do not edit by hand.
/// MessageSearchQuery
public struct MessageSearchQuery: Codable, Sendable {
    /// wire: `conversationId`. 
    public let conversationId: String?
    /// wire: `fromTime`. 起始消息时间（毫秒，含）。
    public let fromTime: UInt64?
    /// wire: `includeRecalled`. 默认排除已撤回消息。
    public let includeRecalled: Bool
    /// wire: `keyword`. 
    public let keyword: String?
    /// wire: `kinds`. 
    public let kinds: [MessageSearchKind]
    /// wire: `limit`. 
    public let limit: UInt32
    /// wire: `senderId`. 
    public let senderId: String?
    /// wire: `toTime`. 截止消息时间（毫秒，含）。
    public let toTime: UInt64?

    public init(conversationId: String? = nil, fromTime: UInt64? = nil, includeRecalled: Bool = false, keyword: String? = nil, kinds: [MessageSearchKind] = [], limit: UInt32 = 0, senderId: String? = nil, toTime: UInt64? = nil) {
        self.conversationId = conversationId
        self.fromTime = fromTime
        self.includeRecalled = includeRecalled
        self.keyword = keyword
        self.kinds = kinds
        self.limit = limit
        self.senderId = senderId
        self.toTime = toTime
    }
}
