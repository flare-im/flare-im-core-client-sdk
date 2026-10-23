import Foundation

/// GENERATED. Do not edit by hand.
/// The receipt projection of a message, computed by the core SDK; kits draw it as is (no host mapping from status, isRead or localState). Incoming messages carry one too, kits show no receipt for them.
public struct MessageReceiptView: Codable, Sendable {
    /// wire: `status`. Receipt state.
    public let status: MessageReceiptStatus
    /// wire: `readSummary`. Only on the viewer's own messages in groups, once the core SDK has read it from Core for a message a view shows (and refreshed on read receipts); absent in single chats, in groups above the large-group threshold, and before it is known. Never a made-up number.
    public let readSummary: MessageReadSummary?

    public init(status: MessageReceiptStatus, readSummary: MessageReadSummary? = nil) {
        self.status = status
        self.readSummary = readSummary
    }
}
