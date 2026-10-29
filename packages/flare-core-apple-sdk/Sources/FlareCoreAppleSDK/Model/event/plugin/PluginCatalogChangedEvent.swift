import Foundation

/// GENERATED. Do not edit by hand.
/// The tenant's plugin catalog changed; the SDK has already invalidated its plugin catalog.
public struct PluginCatalogChangedEvent: Codable, Sendable {
    /// wire: `version`. Plugin authorization projection version Core announced.
    public let version: String

    public init(version: String = "") {
        self.version = version
    }
}
