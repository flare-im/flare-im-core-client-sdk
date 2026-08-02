import Foundation

/// GENERATED. Do not edit by hand.
/// BootstrapHomeTimelineRequest
public struct BootstrapHomeTimelineRequest: Codable, Sendable {
    /// wire: `conversationLimit`. 
    public let conversationLimit: UInt32

    public init(conversationLimit: UInt32 = 0) {
        self.conversationLimit = conversationLimit
    }
}
