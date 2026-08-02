import Foundation

/// GENERATED. Do not edit by hand.
/// One operation in an observable view delta.
public struct ViewDeltaOp: Sendable {
    /// wire: `op`. Delta operation: insert, update, remove, or move.
    public let op: String
    /// wire: `key`. Stable item key owned by core.
    public let key: String
    /// wire: `index`. Target index after applying the operation.
    public let index: UInt32
    /// wire: `fromIndex`. Previous index for move operations.
    public let fromIndex: UInt32?
    /// wire: `item`. Inserted or updated item payload.
    public let item: [String: AnySendable]?

    public init(op: String = "", key: String = "", index: UInt32 = 0, fromIndex: UInt32? = nil, item: [String: AnySendable]? = nil) {
        self.op = op
        self.key = key
        self.index = index
        self.fromIndex = fromIndex
        self.item = item
    }
}
