package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Tagged snapshot emitted by core observable views.
public class ViewSnapshot {
    // wire: `viewType`. Snapshot tag: timeline or conversationList.
    public let viewType: String
    // wire: `data`. Snapshot payload selected by viewType.
    public let data: String

    public init(viewType!: String, data!: String) {
        this.viewType = viewType
        this.data = data
    }
}
