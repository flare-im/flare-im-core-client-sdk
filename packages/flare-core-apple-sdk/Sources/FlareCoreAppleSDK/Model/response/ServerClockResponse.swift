import Foundation

/// GENERATED. Do not edit by hand.
/// The core's estimate of how far the server clock is from this device's.
public struct ServerClockResponse: Codable, Sendable {
    /// wire: `offsetMs`. Server clock minus device clock, in milliseconds; 0 until estimated.
    public let offsetMs: Int64
    /// wire: `estimated`. Whether the offset rests on a server frame received this session.
    public let estimated: Bool

    public init(offsetMs: Int64 = 0, estimated: Bool = false) {
        self.offsetMs = offsetMs
        self.estimated = estimated
    }
}
