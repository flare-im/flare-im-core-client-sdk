import Foundation

/// GENERATED. Do not edit by hand.
/// SDK lifecycle, authenticated session and process-level utilities.
public protocol SessionApiProtocol: AnyObject {
    func create(_ request: [String: AnySendable]) async throws -> [String: AnySendable]
    func `init`(_ request: [String: AnySendable]) async throws -> Void
    func uninit() async throws -> Void
    func login(_ request: [String: AnySendable]) async throws -> Void
    func prepare(_ request: [String: AnySendable]) async throws -> Void
    func connect(_ request: [String: AnySendable]) async throws -> Void
    func updateAccessToken(_ request: [String: AnySendable]) async throws -> Void
    func setHeartbeatAppState(_ request: SetHeartbeatAppStateRequest) async throws -> Void
    func setHeartbeatNatTimeout(_ request: SetHeartbeatNatTimeoutRequest) async throws -> Void
    func heartbeatEffectiveInterval() async throws -> HeartbeatEffectiveIntervalResponse
    func logout() async throws -> Void
    func dispose() async throws -> Void
    func hardReset() async throws -> Void
    func currentUserId() async throws -> [String: AnySendable]
    func isConnected() async throws -> Bool
    func sessionActive() async throws -> Bool
}
