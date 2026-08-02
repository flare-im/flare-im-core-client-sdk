package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// HomeTimelineSnapshot
public class HomeTimelineSnapshot {
    // wire: `conversations`. 
    public let conversations: String
    // wire: `syncState`. 
    public let syncState: TimelineSyncState
    // wire: `totalUnread`. 
    public let totalUnread: UInt64

    public init(conversations!: String, syncState!: TimelineSyncState, totalUnread!: UInt64) {
        this.conversations = conversations
        this.syncState = syncState
        this.totalUnread = totalUnread
    }
}
