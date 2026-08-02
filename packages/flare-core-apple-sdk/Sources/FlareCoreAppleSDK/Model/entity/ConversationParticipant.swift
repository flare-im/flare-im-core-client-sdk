import Foundation

/// GENERATED. Do not edit by hand.
/// SDK 本地会话参与者快照。单聊不依赖该结构；群聊/频道/客服等非单聊用它支撑群通话、成员面板和后续设置页。
public struct ConversationParticipant: Codable, Sendable {
    /// wire: `attributes`. 
    public let attributes: [String: String]
    /// wire: `joinedAt`. 
    public let joinedAt: UInt64
    /// wire: `muted`. 
    public let muted: Bool
    /// wire: `nickname`. 
    public let nickname: String
    /// wire: `pinned`. 
    public let pinned: Bool
    /// wire: `roles`. 
    public let roles: [String]
    /// wire: `userId`. 
    public let userId: String

    public init(attributes: [String: String] = [:], joinedAt: UInt64 = 0, muted: Bool = false, nickname: String = "", pinned: Bool = false, roles: [String] = [], userId: String = "") {
        self.attributes = attributes
        self.joinedAt = joinedAt
        self.muted = muted
        self.nickname = nickname
        self.pinned = pinned
        self.roles = roles
        self.userId = userId
    }
}
