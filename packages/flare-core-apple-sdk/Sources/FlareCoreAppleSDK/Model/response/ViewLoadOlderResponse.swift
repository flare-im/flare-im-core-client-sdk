import Foundation

/// GENERATED. Do not edit by hand.
/// Response returned after extending an observable timeline view.
public struct ViewLoadOlderResponse: Sendable {
    /// wire: `viewId`. Updated timeline view id.
    public let viewId: String
    /// wire: `loadedCount`. Number of older messages inserted into the view window.
    public let loadedCount: UInt32
    /// wire: `hasMore`. Whether older messages may still be available.
    public let hasMore: Bool
    /// wire: `update`. Delta or snapshot that applies this page to the view.
    public let update: ViewUpdate?

    public init(viewId: String = "", loadedCount: UInt32 = 0, hasMore: Bool = false, update: ViewUpdate? = nil) {
        self.viewId = viewId
        self.loadedCount = loadedCount
        self.hasMore = hasMore
        self.update = update
    }
}
