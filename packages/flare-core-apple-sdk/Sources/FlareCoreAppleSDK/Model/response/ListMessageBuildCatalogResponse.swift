import Foundation

/// GENERATED. Do not edit by hand.
/// Catalog of all supported message build operations.
public struct ListMessageBuildCatalogResponse: Codable, Sendable {
    /// wire: `entries`. Supported build operations.
    public let entries: [MessageBuildCatalogEntry]

    public init(entries: [MessageBuildCatalogEntry] = []) {
        self.entries = entries
    }
}
