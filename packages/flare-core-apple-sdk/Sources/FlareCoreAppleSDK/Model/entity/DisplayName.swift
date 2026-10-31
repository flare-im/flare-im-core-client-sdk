import Foundation

/// GENERATED. Do not edit by hand.
/// Final name of a person or conversation projected by core-sdk (title-and-name-projection). Tagged by kind: named {text, source}; members {names, total} for an unnamed group titled by up to three named members other than the current user (total counts every member, the current user included); unnamed {entity, idTail} where idTail is the last four characters of the id (empty when there is none). Hosts render it with the kit's flareDisplayNameText; an id is never a name.
public struct DisplayName: Codable, Sendable {
    /// wire: `kind`. named, members or unnamed.
    public let kind: DisplayNameKind
    /// wire: `text`. The name; present when kind is named.
    public let text: String?
    /// wire: `source`. Where the name came from; present when kind is named.
    public let source: NameSource?
    /// wire: `names`. Up to three member names in server order; present when kind is members.
    public let names: [String]?
    /// wire: `total`. Member count including the current user; present when kind is members.
    public let total: UInt32?
    /// wire: `entity`. What is unnamed; present when kind is unnamed.
    public let entity: NameEntity?
    /// wire: `idTail`. Last four characters of the id, empty without an id; present when kind is unnamed.
    public let idTail: String?

    public init(kind: DisplayNameKind, text: String? = nil, source: NameSource? = nil, names: [String]? = nil, total: UInt32? = nil, entity: NameEntity? = nil, idTail: String? = nil) {
        self.kind = kind
        self.text = text
        self.source = source
        self.names = names
        self.total = total
        self.entity = entity
        self.idTail = idTail
    }
}
