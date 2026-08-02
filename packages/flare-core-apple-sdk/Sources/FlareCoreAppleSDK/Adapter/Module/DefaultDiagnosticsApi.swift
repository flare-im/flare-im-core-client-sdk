import Foundation

/// GENERATED. Do not edit by hand.
public final class DefaultDiagnosticsApi: DiagnosticsApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func getSdkVersion() async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.diagnosticsSdkVersion, request: nil)
    }

    public func getFfiContractVersion() async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.diagnosticsFfiContractVersion, request: nil)
    }

    public func getDataRoot() async throws -> [String: AnySendable] {
        return try await invokeMap(bridge, descriptor: NativeCallMap.diagnosticsDataRoot, request: nil)
    }

    public func getRuntimeHealth() async throws -> RuntimeHealthResponse {
        let raw = try await invokeMap(bridge, descriptor: NativeCallMap.diagnosticsRuntimeHealth, request: nil)
        return try runtimeHealthResponseFromJson(raw)
    }
}
