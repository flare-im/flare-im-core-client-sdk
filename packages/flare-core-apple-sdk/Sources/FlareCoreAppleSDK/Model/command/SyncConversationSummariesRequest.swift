import Foundation

/// GENERATED. Do not edit by hand.
/// Request for summary sync with client-known conversation versions.
public struct SyncConversationSummariesRequest: Codable, Sendable {
    /// wire: `knownVersions`. 
    public let knownVersions: [ConversationVersion]

    public init(knownVersions: [ConversationVersion] = []) {
        self.knownVersions = knownVersions
    }
}
