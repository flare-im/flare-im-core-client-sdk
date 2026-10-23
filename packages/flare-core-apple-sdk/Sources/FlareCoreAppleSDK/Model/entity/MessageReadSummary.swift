import Foundation

/// GENERATED. Do not edit by hand.
/// Who read one of the viewer's own messages in a group, the sender excluded: total = readCount + unreadCount, always above 0.
public struct MessageReadSummary: Codable, Sendable {
    /// wire: `readCount`. Members who read the message.
    public let readCount: UInt32
    /// wire: `unreadCount`. Members who have not read it yet.
    public let unreadCount: UInt32
    /// wire: `total`. Members the message counts, the sender excluded.
    public let total: UInt32

    public init(readCount: UInt32 = 0, unreadCount: UInt32 = 0, total: UInt32 = 0) {
        self.readCount = readCount
        self.unreadCount = unreadCount
        self.total = total
    }
}
