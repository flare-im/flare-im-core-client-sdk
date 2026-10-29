package flare_core_harmony_cangjie_sdk.model.event.plugin

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// The tenant's plugin catalog changed; the SDK has already invalidated its plugin catalog.
public class PluginCatalogChangedEvent {
    // wire: `version`. Plugin authorization projection version Core announced.
    public let version: String

    public init(version!: String) {
        this.version = version
    }
}
