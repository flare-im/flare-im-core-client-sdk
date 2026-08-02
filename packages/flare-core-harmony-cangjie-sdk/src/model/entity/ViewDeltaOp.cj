package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// One operation in an observable view delta.
public class ViewDeltaOp {
    // wire: `op`. Delta operation: insert, update, remove, or move.
    public let op: String
    // wire: `key`. Stable item key owned by core.
    public let key: String
    // wire: `index`. Target index after applying the operation.
    public let index: UInt32
    // wire: `fromIndex`. Optional. Previous index for move operations.
    public let fromIndex: ?UInt32
    // wire: `item`. Optional. Inserted or updated item payload.
    public let item: ?String

    public init(op!: String, key!: String, index!: UInt32, fromIndex!: ?UInt32, item!: ?String) {
        this.op = op
        this.key = key
        this.index = index
        this.fromIndex = fromIndex
        this.item = item
    }
}
