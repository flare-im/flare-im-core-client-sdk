package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request for extending a timeline view that is not attached to the latest with newer messages.
public class LoadNewerTimelineViewRequest {
    // wire: `viewId`. Timeline view id returned from openTimeline.
    public let viewId: String
    // wire: `messageLimit`. Maximum newer messages to load in this page.
    public let messageLimit: UInt32

    public init(viewId!: String, messageLimit!: UInt32) {
        this.viewId = viewId
        this.messageLimit = messageLimit
    }
}
