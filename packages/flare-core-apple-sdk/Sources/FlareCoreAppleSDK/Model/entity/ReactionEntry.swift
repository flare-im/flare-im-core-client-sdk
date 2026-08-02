import Foundation

/// GENERATED. Do not edit by hand.
/// ReactionEntry
public struct ReactionEntry: Codable, Sendable {
    /// wire: `count`. 
    public let count: UInt32
    /// wire: `emoji`. 
    public let emoji: String
    /// wire: `userIds`. 
    public let userIds: [String]

    public init(count: UInt32 = 0, emoji: String = "", userIds: [String] = []) {
        self.count = count
        self.emoji = emoji
        self.userIds = userIds
    }
}
