// GENERATED. Do not edit by hand.
/** Callback invoked for one typed SDK notification. */
export type EventCallback<T> = (event: T) => void;

/** Disposable local listener registration returned by high-level `on*` APIs. */
export interface EventSubscription {
  readonly id: string;
  unsubscribe(): void;
}
