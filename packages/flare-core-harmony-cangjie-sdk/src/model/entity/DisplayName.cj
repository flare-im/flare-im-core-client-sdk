package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// Final name of a person or conversation projected by core-sdk (title-and-name-projection). Tagged by kind: named {text, source}; members {names, total} for an unnamed group titled by up to three named members other than the current user (total counts every member, the current user included); unnamed {entity, idTail} where idTail is the last four characters of the id (empty when there is none). Hosts render it with the kit's flareDisplayNameText; an id is never a name.
public class DisplayName {
    // wire: `kind`. named, members or unnamed.
    public let kind: DisplayNameKind
    // wire: `text`. Optional. The name; present when kind is named.
    public let text: ?String
    // wire: `source`. Optional. Where the name came from; present when kind is named.
    public let source: ?NameSource
    // wire: `names`. Optional. Up to three member names in server order; present when kind is members.
    public let names: ?String
    // wire: `total`. Optional. Member count including the current user; present when kind is members.
    public let total: ?UInt32
    // wire: `entity`. Optional. What is unnamed; present when kind is unnamed.
    public let entity: ?NameEntity
    // wire: `idTail`. Optional. Last four characters of the id, empty without an id; present when kind is unnamed.
    public let idTail: ?String

    public init(kind!: DisplayNameKind, text!: ?String, source!: ?NameSource, names!: ?String, total!: ?UInt32, entity!: ?NameEntity, idTail!: ?String) {
        this.kind = kind
        this.text = text
        this.source = source
        this.names = names
        this.total = total
        this.entity = entity
        this.idTail = idTail
    }
}
