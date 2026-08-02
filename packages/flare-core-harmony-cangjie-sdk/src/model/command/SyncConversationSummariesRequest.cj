package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Request for summary sync with client-known conversation versions.
public class SyncConversationSummariesRequest {
    // wire: `knownVersions`. 
    public let knownVersions: String

    public init(knownVersions!: String) {
        this.knownVersions = knownVersions
    }
}
