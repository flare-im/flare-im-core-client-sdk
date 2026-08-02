import Foundation

/// GENERATED. Do not edit by hand.
/// Response returned when closing an observable view.
public struct CloseViewResponse: Codable, Sendable {
    /// wire: `closed`. Whether a view registration was closed.
    public let closed: Bool

    public init(closed: Bool = false) {
        self.closed = closed
    }
}
