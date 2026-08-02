package flare_core_harmony_cangjie_sdk.model.command

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Runtime NAT timeout hint for adaptive heartbeat scheduling. Omit or pass null to clear the hint.
public class SetHeartbeatNatTimeoutRequest {
    // wire: `natTimeoutSecs`. Optional. Observed NAT idle timeout in seconds.
    public let natTimeoutSecs: ?UInt32

    public init(natTimeoutSecs!: ?UInt32) {
        this.natTimeoutSecs = natTimeoutSecs
    }
}
