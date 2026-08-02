import Foundation

/// GENERATED. Do not edit by hand.
/// MessagePreview
public struct MessagePreview: Codable, Sendable {
    /// wire: `messageId`. 
    public let messageId: String
    /// wire: `senderId`. 
    public let senderId: String
    /// wire: `text`. 
    public let text: String
    /// wire: `time`. 毫秒时间戳
    public let time: UInt64
    /// wire: `type`. 
    public let type: Int32

    public init(messageId: String = "", senderId: String = "", text: String = "", time: UInt64 = 0, type: Int32 = 0) {
        self.messageId = messageId
        self.senderId = senderId
        self.text = text
        self.time = time
        self.type = type
    }
}
