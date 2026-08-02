import Foundation

/// GENERATED. Do not edit by hand.
/// Capability discovery and optional plugin dispatch through capability dispatch ops.
public protocol CapabilitiesApiProtocol: AnyObject {
    func listCapabilities(_ request: [String: AnySendable]) async throws -> [String: AnySendable]
    func listUserCapabilities(_ request: [String: AnySendable]) async throws -> [String: AnySendable]
    func dispatchCapability(_ request: [String: AnySendable]) async throws -> [String: AnySendable]
    func grantCapability(_ request: [String: AnySendable]) async throws -> Void
    func revokeCapability(_ request: [String: AnySendable]) async throws -> Void
    func sendCallSignal(_ request: [String: AnySendable]) async throws -> Void
}
