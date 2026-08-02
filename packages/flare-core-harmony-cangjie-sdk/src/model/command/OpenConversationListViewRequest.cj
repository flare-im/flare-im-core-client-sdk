package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request for opening an observable conversation list view.
public class OpenConversationListViewRequest {
    // wire: `conversationLimit`. Maximum conversations to include in the initial snapshot.
    public let conversationLimit: UInt32

    public init(conversationLimit!: UInt32) {
        this.conversationLimit = conversationLimit
    }
}
