import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultCapabilitiesApi: CapabilitiesApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func listCapabilities(_ request: [String: AnySendable]) async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.capabilityList, request: unwrapRequest(AnySendable(request)))
    }

    public func listUserCapabilities(_ request: [String: AnySendable]) async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.capabilityListUser, request: unwrapRequest(AnySendable(request)))
    }

    public func dispatchCapability(_ request: [String: AnySendable]) async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.capabilityDispatch, request: unwrapRequest(AnySendable(request)))
    }

    public func grantCapability(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.capabilityGrant, request: AnySendable(request))
    }

    public func revokeCapability(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.capabilityRevoke, request: AnySendable(request))
    }

    public func sendCallSignal(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.capabilitySendCallSignal, request: AnySendable(request))
    }
}
