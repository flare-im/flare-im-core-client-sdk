import Foundation

/// GENERATED. Do not edit by hand.
/// User profile cache (business-fed identity for messages and conversations).
public protocol UserApiProtocol: AnyObject {
    func upsertUserProfiles(_ request: [String: AnySendable]) async throws -> Void
}
