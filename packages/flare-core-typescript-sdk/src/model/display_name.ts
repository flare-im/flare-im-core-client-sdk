/** GENERATED. Do not edit by hand. */
import type { DisplayNameKind } from './display_name_kind';
import type { NameEntity } from './name_entity';
import type { NameSource } from './name_source';

/** Final name of a person or conversation projected by core-sdk (title-and-name-projection). Tagged by kind: named {text, source}; members {names, total} for an unnamed group titled by up to three named members other than the current user (total counts every member, the current user included); unnamed {entity, idTail} where idTail is the last four characters of the id (empty when there is none). Hosts render it with the kit's flareDisplayNameText; an id is never a name. */
export interface DisplayName {
  /** wire: `kind`. named, members or unnamed. */
  kind: DisplayNameKind;
  /** wire: `text`. The name; present when kind is named. */
  text?: string;
  /** wire: `source`. Where the name came from; present when kind is named. */
  source?: NameSource;
  /** wire: `names`. Up to three member names in server order; present when kind is members. */
  names?: string[];
  /** wire: `total`. Member count including the current user; present when kind is members. */
  total?: number;
  /** wire: `entity`. What is unnamed; present when kind is unnamed. */
  entity?: NameEntity;
  /** wire: `idTail`. Last four characters of the id, empty without an id; present when kind is unnamed. */
  idTail?: string;
}
