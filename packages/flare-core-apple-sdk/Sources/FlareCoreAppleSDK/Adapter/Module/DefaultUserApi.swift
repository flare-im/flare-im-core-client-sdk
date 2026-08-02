import Foundation

/// User profile cache facade. Business pushes identity (name/avatar) here; reads
/// batch-join the cache to render current identity. Operation `user.upsert_profiles`
/// goes through the JSON contract invoke boundary (`flare_sdk_invoke_json`).
public final class DefaultUserApi: UserApiProtocol {
    private let bridge: any NativeBridgeProtocol

    public init(bridge: any NativeBridgeProtocol) {
        self.bridge = bridge
    }

    public func upsertUserProfiles(_ request: [String: AnySendable]) async throws -> Void {
        try await invokeVoid(bridge, descriptor: NativeCallMap.userUpsertProfiles, request: AnySendable(request))
    }
}
