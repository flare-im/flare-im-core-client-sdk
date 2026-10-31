// GENERATED. Do not edit by hand.
import 'display_name_kind.dart';
import 'name_entity.dart';
import 'name_source.dart';

/// Final name of a person or conversation projected by core-sdk (title-and-name-projection). Tagged by kind: named {text, source}; members {names, total} for an unnamed group titled by up to three named members other than the current user (total counts every member, the current user included); unnamed {entity, idTail} where idTail is the last four characters of the id (empty when there is none). Hosts render it with the kit's flareDisplayNameText; an id is never a name.
final class DisplayName {
  /// wire: `kind`. named, members or unnamed.
  final DisplayNameKind kind;
  /// wire: `text`. The name; present when kind is named.
  final String? text;
  /// wire: `source`. Where the name came from; present when kind is named.
  final NameSource? source;
  /// wire: `names`. Up to three member names in server order; present when kind is members.
  final List<String>? names;
  /// wire: `total`. Member count including the current user; present when kind is members.
  final int? total;
  /// wire: `entity`. What is unnamed; present when kind is unnamed.
  final NameEntity? entity;
  /// wire: `idTail`. Last four characters of the id, empty without an id; present when kind is unnamed.
  final String? idTail;

  const DisplayName({
    required this.kind,
    this.text,
    this.source,
    this.names,
    this.total,
    this.entity,
    this.idTail,
  });
}
