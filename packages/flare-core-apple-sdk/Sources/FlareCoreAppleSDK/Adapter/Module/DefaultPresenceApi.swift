import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultPresenceApi: PresenceApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func getUserPresence(_ request: [String: AnySendable]) async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.presenceGet, request: unwrapRequest(AnySendable(request)))
    }

    public func batchGetUserPresence(_ request: [String: AnySendable]) async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.presenceBatchGet, request: unwrapRequest(AnySendable(request)))
    }

    public func subscribeUserPresence(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.presenceSubscribe, request: AnySendable(request))
    }
}
