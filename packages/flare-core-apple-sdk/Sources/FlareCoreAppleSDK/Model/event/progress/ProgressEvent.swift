import Foundation

/// GENERATED. Do not edit by hand.
/// Generic sync, upload or download progress notification.
public struct ProgressEvent: Codable, Sendable {
    /// wire: `name`. Progress event name.
    public let name: ProgressEventName
    /// wire: `operation`. Operation being tracked.
    public let operation: String
    /// wire: `current`. Current progress units.
    public let current: UInt64
    /// wire: `total`. Total progress units.
    public let total: UInt64
    /// wire: `taskId`. Task identifier when available.
    public let taskId: String?
    /// wire: `detail`. Human-readable progress detail.
    public let detail: String?

    public init(name: ProgressEventName, operation: String = "", current: UInt64 = 0, total: UInt64 = 0, taskId: String? = nil, detail: String? = nil) {
        self.name = name
        self.operation = operation
        self.current = current
        self.total = total
        self.taskId = taskId
        self.detail = detail
    }
}
