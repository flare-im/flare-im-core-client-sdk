import Foundation

/// GENERATED. Do not edit by hand.
/// Forward message payload.
public struct ForwardContentPayload: Codable, Sendable {
    /// wire: `merge`. Merge forwarded messages into one card.
    public let merge: Bool?
    /// wire: `title`. Forward title.
    public let title: String?
    /// wire: `sourceMessages`. Forwarded sources.
    public let sourceMessages: [ForwardSourceMessage]

    public init(merge: Bool? = nil, title: String? = nil, sourceMessages: [ForwardSourceMessage] = []) {
        self.merge = merge
        self.title = title
        self.sourceMessages = sourceMessages
    }
}
