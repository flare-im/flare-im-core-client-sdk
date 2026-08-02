package flare_core_harmony_cangjie_sdk.model.event.progress

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Generic sync, upload or download progress notification.
public class ProgressEvent {
    // wire: `name`. Progress event name.
    public let name: ProgressEventName
    // wire: `operation`. Operation being tracked.
    public let operation: String
    // wire: `current`. Current progress units.
    public let current: UInt64
    // wire: `total`. Total progress units.
    public let total: UInt64
    // wire: `taskId`. Optional. Task identifier when available.
    public let taskId: ?String
    // wire: `detail`. Optional. Human-readable progress detail.
    public let detail: ?String

    public init(name!: ProgressEventName, operation!: String, current!: UInt64, total!: UInt64, taskId!: ?String, detail!: ?String) {
        this.name = name
        this.operation = operation
        this.current = current
        this.total = total
        this.taskId = taskId
        this.detail = detail
    }
}
