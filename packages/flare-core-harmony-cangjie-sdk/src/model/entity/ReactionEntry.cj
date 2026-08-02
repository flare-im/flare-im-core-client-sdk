package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// ReactionEntry
public class ReactionEntry {
    // wire: `count`. 
    public let count: UInt32
    // wire: `emoji`. 
    public let emoji: String
    // wire: `userIds`. 
    public let userIds: String

    public init(count!: UInt32, emoji!: String, userIds!: String) {
        this.count = count
        this.emoji = emoji
        this.userIds = userIds
    }
}
