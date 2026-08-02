import Foundation

/// GENERATED. Do not edit by hand.
/// Connection state and manual network lifecycle.
public protocol ConnectionApiProtocol: AnyObject {
    func getConnectionState() async throws -> ConnectionState
    func disconnect() async throws -> Void
    func notifyNetworkChange(_ request: NetworkChangeRequest) async throws -> NetworkChangeResponse
}
