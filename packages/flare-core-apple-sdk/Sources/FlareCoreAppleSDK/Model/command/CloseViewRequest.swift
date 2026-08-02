import Foundation

/// GENERATED. Do not edit by hand.
/// Request for closing an observable view.
public struct CloseViewRequest: Codable, Sendable {
    /// wire: `viewId`. View id returned from an open view call.
    public let viewId: String

    public init(viewId: String = "") {
        self.viewId = viewId
    }
}
