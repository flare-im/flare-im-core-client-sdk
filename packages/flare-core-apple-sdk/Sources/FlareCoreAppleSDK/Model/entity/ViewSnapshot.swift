import Foundation

/// GENERATED. Do not edit by hand.
/// Tagged snapshot emitted by core observable views.
public struct ViewSnapshot: Sendable {
    /// wire: `viewType`. Snapshot tag: timeline or conversationList.
    public let viewType: String
    /// wire: `data`. Snapshot payload selected by viewType.
    public let data: [String: AnySendable]

    public init(viewType: String = "", data: [String: AnySendable] = [:]) {
        self.viewType = viewType
        self.data = data
    }
}
