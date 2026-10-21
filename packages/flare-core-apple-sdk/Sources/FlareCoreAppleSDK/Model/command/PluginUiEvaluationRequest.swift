import Foundation

/// GENERATED. Do not edit by hand.
/// 
public struct PluginUiEvaluationRequest: Sendable {
    /// wire: `payload`. Typed UI evaluation envelope defined by the shared UI protocol.
    public let payload: [String: AnySendable]

    public init(payload: [String: AnySendable] = [:]) {
        self.payload = payload
    }
}
