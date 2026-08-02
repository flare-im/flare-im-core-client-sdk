/** GENERATED. Do not edit by hand. */

/** One operation in an observable view delta. */
export interface ViewDeltaOp {
  /** wire: `op`. Delta operation: insert, update, remove, or move. */
  op: string;
  /** wire: `key`. Stable item key owned by core. */
  key: string;
  /** wire: `index`. Target index after applying the operation. */
  index: number;
  /** wire: `fromIndex`. Previous index for move operations. */
  fromIndex?: number;
  /** wire: `item`. Inserted or updated item payload. */
  item?: Record<string, unknown>;
}
