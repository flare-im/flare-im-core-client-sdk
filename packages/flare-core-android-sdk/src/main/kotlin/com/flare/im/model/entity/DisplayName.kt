package com.flare.im.model.entity

/** GENERATED. Do not edit by hand. */
/** Final name of a person or conversation projected by core-sdk (title-and-name-projection). Tagged by kind: named {text, source}; members {names, total} for an unnamed group titled by up to three named members other than the current user (total counts every member, the current user included); unnamed {entity, idTail} where idTail is the last four characters of the id (empty when there is none). Hosts render it with the kit's flareDisplayNameText; an id is never a name. */
data class DisplayName(
    /** wire: `kind`. named, members or unnamed. */
    val kind: DisplayNameKind,
    /** wire: `text`. The name; present when kind is named. */
    val text: String? = null,
    /** wire: `source`. Where the name came from; present when kind is named. */
    val source: NameSource? = null,
    /** wire: `names`. Up to three member names in server order; present when kind is members. */
    val names: List<String>? = null,
    /** wire: `total`. Member count including the current user; present when kind is members. */
    val total: Int? = null,
    /** wire: `entity`. What is unnamed; present when kind is unnamed. */
    val entity: NameEntity? = null,
    /** wire: `idTail`. Last four characters of the id, empty without an id; present when kind is unnamed. */
    val idTail: String? = null,
)
