import Foundation

/// GENERATED. Do not edit by hand.
/// Presence and input state.
public protocol PresenceApiProtocol: AnyObject {
    func getUserPresence(_ request: [String: AnySendable]) async throws -> [String: AnySendable]
    func batchGetUserPresence(_ request: [String: AnySendable]) async throws -> [String: AnySendable]
    func subscribeUserPresence(_ request: [String: AnySendable]) async throws -> Void
}
