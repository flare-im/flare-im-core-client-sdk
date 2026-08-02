package flare_core_harmony_cangjie_sdk.model.event.capability

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Capability/plugin notification payload.
public class CapabilityEvent {
    // wire: `name`. Capability event name.
    public let name: CapabilityEventName
    // wire: `capability`. Optional. Capability key.
    public let capability: ?String
    // wire: `reason`. Optional. Unavailable/change reason.
    public let reason: ?String

    public init(name!: CapabilityEventName, capability!: ?String, reason!: ?String) {
        this.name = name
        this.capability = capability
        this.reason = reason
    }
}
