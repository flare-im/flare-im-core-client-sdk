package flare_core_harmony_cangjie_sdk.model.response

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// The core's estimate of how far the server clock is from this device's.
public class ServerClockResponse {
    // wire: `offsetMs`. Server clock minus device clock, in milliseconds; 0 until estimated.
    public let offsetMs: Int64
    // wire: `estimated`. Whether the offset rests on a server frame received this session.
    public let estimated: Bool

    public init(offsetMs!: Int64, estimated!: Bool) {
        this.offsetMs = offsetMs
        this.estimated = estimated
    }
}
