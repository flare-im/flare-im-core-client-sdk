import Foundation

/// GENERATED. Do not edit by hand.
/// SDK version and FFI contract diagnostics.
public protocol DiagnosticsApiProtocol: AnyObject {
    func getSdkVersion() async throws -> [String: AnySendable]
    func getFfiContractVersion() async throws -> [String: AnySendable]
    func getDataRoot() async throws -> [String: AnySendable]
    func getRuntimeHealth() async throws -> RuntimeHealthResponse
}
