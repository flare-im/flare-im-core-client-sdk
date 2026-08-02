import Foundation

/// GENERATED. Do not edit by hand.
/// Sync orchestration event notification name.
public enum SyncEventName: String, Codable, Sendable {
    case stateChanged = "state_changed"
    case started = "started"
    case finished = "finished"
    case failed = "failed"
    case progress = "progress"
    case taskCompleted = "task_completed"
    case resyncNeeded = "resync_needed"
    case readiness = "readiness"
}
