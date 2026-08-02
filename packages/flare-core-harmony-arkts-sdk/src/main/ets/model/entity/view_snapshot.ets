// GENERATED. Do not edit by hand.

/** Tagged snapshot emitted by core observable views. */
export interface ViewSnapshot {
  /** wire: `viewType`. Snapshot tag: timeline or conversationList. */
  viewType: string;
  /** wire: `data`. Snapshot payload selected by viewType. */
  data: Record<string, Object>;
}
