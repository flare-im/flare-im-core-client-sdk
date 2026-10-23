package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Who read one of the viewer's own messages in a group, the sender excluded: total = readCount + unreadCount, always above 0.
public class MessageReadSummary {
    // wire: `readCount`. Members who read the message.
    public let readCount: UInt32
    // wire: `unreadCount`. Members who have not read it yet.
    public let unreadCount: UInt32
    // wire: `total`. Members the message counts, the sender excluded.
    public let total: UInt32

    public init(readCount!: UInt32, unreadCount!: UInt32, total!: UInt32) {
        this.readCount = readCount
        this.unreadCount = unreadCount
        this.total = total
    }
}
