/** GENERATED. Do not edit by hand. */

/**
 * Style 1 — **event callback**: one handler per subscription.
 * Used by `client.events.onMessageReceived(cb)` and bridge `event.subscribe`.
 */
export type EventCallback<T> = (event: T) => void;

/** Alias for documentation; same as {@link EventCallback}. */
export type ListenerHandler<T> = EventCallback<T>;

/**
 * Style 2 — **subscription handle**: returned by `on*` / `addEventListener`; call `unsubscribe()` to detach.
 */
export interface EventSubscription {
  readonly id: string | number;
  unsubscribe(): void;
}

/** FFI/event-bus subscription id (numeric handle from native `event.subscribe`). */
export interface NativeEventSubscription {
  readonly id: bigint | number;
}
