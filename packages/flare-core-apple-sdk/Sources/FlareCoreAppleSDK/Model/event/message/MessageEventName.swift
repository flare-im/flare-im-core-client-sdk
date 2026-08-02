import Foundation

/// GENERATED. Do not edit by hand.
/// Message event notification name.
public enum MessageEventName: String, Codable, Sendable {
    case received = "received"
    case receivedBatch = "received_batch"
    case sendAck = "send_ack"
    case sendFailed = "send_failed"
    case capability = "capability"
    case recalled = "recalled"
    case typing = "typing"
    case typingAggregate = "typing_aggregate"
    case edited = "edited"
    case reactionChanged = "reaction_changed"
    case deleted = "deleted"
    case readReceipt = "read_receipt"
    case burnScheduled = "burn_scheduled"
    case burned = "burned"
    case hardDeleted = "hard_deleted"
    case pinned = "pinned"
    case unpinned = "unpinned"
    case marked = "marked"
    case unmarked = "unmarked"
    case retentionScheduled = "retention_scheduled"
    case retentionExpired = "retention_expired"
    case retentionPurged = "retention_purged"
    case presenceChanged = "presence_changed"
    case callSignal = "call_signal"
    case custom = "custom"
}
