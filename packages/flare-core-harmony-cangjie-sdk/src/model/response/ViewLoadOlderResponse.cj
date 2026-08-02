package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Response returned after extending an observable timeline view.
public class ViewLoadOlderResponse {
    // wire: `viewId`. Updated timeline view id.
    public let viewId: String
    // wire: `loadedCount`. Number of older messages inserted into the view window.
    public let loadedCount: UInt32
    // wire: `hasMore`. Whether older messages may still be available.
    public let hasMore: Bool
    // wire: `update`. Optional. Delta or snapshot that applies this page to the view.
    public let update: ?ViewUpdate

    public init(viewId!: String, loadedCount!: UInt32, hasMore!: Bool, update!: ?ViewUpdate) {
        this.viewId = viewId
        this.loadedCount = loadedCount
        this.hasMore = hasMore
        this.update = update
    }
}
