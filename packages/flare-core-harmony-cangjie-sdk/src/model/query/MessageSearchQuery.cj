package flare_core_harmony_cangjie_sdk.model.query

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// MessageSearchQuery
public class MessageSearchQuery {
    // wire: `conversationId`. Optional. 
    public let conversationId: ?String
    // wire: `fromTime`. Optional. 起始消息时间（毫秒，含）。
    public let fromTime: ?UInt64
    // wire: `includeRecalled`. 默认排除已撤回消息。
    public let includeRecalled: Bool
    // wire: `keyword`. Optional. 
    public let keyword: ?String
    // wire: `kinds`. 
    public let kinds: String
    // wire: `limit`. 
    public let limit: UInt32
    // wire: `senderId`. Optional. 
    public let senderId: ?String
    // wire: `toTime`. Optional. 截止消息时间（毫秒，含）。
    public let toTime: ?UInt64

    public init(conversationId!: ?String, fromTime!: ?UInt64, includeRecalled!: Bool, keyword!: ?String, kinds!: String, limit!: UInt32, senderId!: ?String, toTime!: ?UInt64) {
        this.conversationId = conversationId
        this.fromTime = fromTime
        this.includeRecalled = includeRecalled
        this.keyword = keyword
        this.kinds = kinds
        this.limit = limit
        this.senderId = senderId
        this.toTime = toTime
    }
}
