import Foundation

/// GENERATED. Do not edit by hand.
/// Receipt state the core SDK projects for a message: pending (built locally, not yet sending), sending (no server sequence yet, media uploading included), sent (the server has it), read (single chat: the peer read it; group: the read summary says all members read it), failed (retryable). There is no delivered state.
public enum MessageReceiptStatus: String, Codable, Sendable {
    case pending = "pending"
    case sending = "sending"
    case sent = "sent"
    case read = "read"
    case failed = "failed"
}
