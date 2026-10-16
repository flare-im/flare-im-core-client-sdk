import Foundation

/// GENERATED. Do not edit by hand.
/// SetPushPermissionRequest
public struct SetPushPermissionRequest: Codable, Sendable {
    /// wire: `allowed`. Current OS permission, including explicit denial or revocation.
    public let allowed: Bool

    public init(allowed: Bool = false) {
        self.allowed = allowed
    }
}
