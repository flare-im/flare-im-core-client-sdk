import Foundation

/// GENERATED. Do not edit by hand.
/// Sync orchestration notification payload.
public struct SyncEvent: Codable, Sendable {
    /// wire: `name`. Sync event name.
    public let name: SyncEventName
    /// wire: `runId`. Stable sync run id used to correlate readiness, progress, and completion.
    public let runId: String?
    /// wire: `trigger`. Sync trigger.
    public let trigger: String?
    /// wire: `scope`. Sync scope.
    public let scope: String?
    /// wire: `visibility`. Sync visibility policy.
    public let visibility: String?
    /// wire: `reason`. Sync reason for diagnostics and startup wait reports.
    public let reason: String?
    /// wire: `phase`. Sync phase.
    public let phase: String?
    /// wire: `task`. Sync task name.
    public let task: String?
    /// wire: `stage`. Readiness stage for sync.readiness events.
    public let stage: String?
    /// wire: `progress`. Progress percentage from 0 to 100.
    public let progress: UInt32?
    /// wire: `error`. Failure details for failed sync events.
    public let error: SdkErrorPayload?

    public init(name: SyncEventName, runId: String? = nil, trigger: String? = nil, scope: String? = nil, visibility: String? = nil, reason: String? = nil, phase: String? = nil, task: String? = nil, stage: String? = nil, progress: UInt32? = nil, error: SdkErrorPayload? = nil) {
        self.name = name
        self.runId = runId
        self.trigger = trigger
        self.scope = scope
        self.visibility = visibility
        self.reason = reason
        self.phase = phase
        self.task = task
        self.stage = stage
        self.progress = progress
        self.error = error
    }
}
