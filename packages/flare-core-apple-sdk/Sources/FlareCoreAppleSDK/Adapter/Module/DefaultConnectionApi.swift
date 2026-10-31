import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultConnectionApi: ConnectionApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func getConnectionState() async throws -> ConnectionState {
        return try await invokeConnectionState(bridge, descriptor: NativeCallMap.connectionGetState, request: nil)
    }

    public func disconnect() async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.connectionDisconnect, request: nil)
    }

    public func getServerClock() async throws -> ServerClockResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.connectionServerClock, request: nil)
        return try serverClockResponseFromJson(raw)
    }

    public func notifyNetworkChange(_ request: NetworkChangeRequest) async throws -> NetworkChangeResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.connectionNotifyNetworkChange, request: unwrapRequest(AnySendable(networkChangeRequestToMap(request))))
        return try networkChangeResponseFromJson(raw)
    }
}
