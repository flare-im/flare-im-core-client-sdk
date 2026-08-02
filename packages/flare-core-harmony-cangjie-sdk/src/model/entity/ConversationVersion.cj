package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Version stamp used by sync summary reconciliation.
public class ConversationVersion {
    // wire: `conversationId`. 
    public let conversationId: String
    // wire: `version`. 
    public let version: UInt64

    public init(conversationId!: String, version!: UInt64) {
        this.conversationId = conversationId
        this.version = version
    }
}
