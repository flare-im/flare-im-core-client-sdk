# Runtime Contracts

This document defines adapter-level runtime behavior for every platform SDK. The Rust core still owns IM business behavior; these contracts only define how client SDKs expose that behavior safely.

## Client Lifecycle

Canonical lifecycle:

```text
create(config)
login(request)
use module APIs
logout()
dispose()
```

- One `FlareImClient` instance represents one app/session boundary.
- `init` must complete before APIs that require storage, networking, or native handles.
- `login` and `logout` are command APIs. Their return values are the primary success/failure contract.
- Lifecycle events such as `onInitialized`, `onLoginSucceeded`, and `onLoginFailed` are notifications for global observers, UI state, diagnostics, and integration code.
- `dispose` must release native handles, unregister callbacks, close local streams, and make all later calls fail with `notInitialized` or an equivalent stable SDK error.

## Event Delivery

- `client.events.subscribeEvents` is the canonical bridge-level stream.
- `client.events.on*` and listener objects are adapter-level conveniences over the same event stream.
- Listener callbacks must not block native callback threads.
- UI-facing callbacks must be dispatched according to the platform's documented rule:
  - Android: main dispatcher when callback is UI-oriented; `Flow` collection context remains caller-controlled.
  - Apple: main actor or documented queue for UI-oriented callbacks.
  - Flutter: Dart isolate event loop.
  - ArkTS/TypeScript: event loop/microtask scheduling.
  - Cangjie: runtime adapter must document its dispatch executor.
- Event order is preserved per native client handle. Cross-handle global ordering is not guaranteed.

## Subscription Ownership

- Every listener registration returns an `EventSubscription`.
- Calling `unsubscribe` must be idempotent.
- `unsubscribeAll` removes bridge-level subscriptions for the client.
- `dispose` must cancel all local listener registrations and bridge subscriptions owned by the client.
- Listener callbacks must never keep strong references to platform UI objects longer than the returned subscription lifetime.

## Message Send Callback

`messages.sendMessage(request, callback)` has two layers:

- The returned `SendMessageResponse` is the command result.
- `MessageSendCallback` is an optional adapter notification surface for progress and terminal state.

The callback contract is:

- `onProgress` may be called zero or more times.
- Exactly one terminal callback should be emitted when the adapter can observe the terminal state: `onSuccess` or `onFailure`.
- `onSuccess` should use the same acknowledgement payload as the returned command result.
- `onFailure` must include a stable error payload when the failure can be mapped.
- If a platform cannot observe upload progress for a specific transport, it must still support `onSuccess` and `onFailure`.
- Callback absence must not change message send behavior.

## Backpressure

- Native-to-platform event queues must be bounded where the platform provides a queue boundary.
- If dropping is unavoidable, adapters should prefer dropping duplicate progress updates over dropping terminal events, message events, connection events, or lifecycle failures.
- Dropped event counts should be visible through diagnostics before public release.

## Error Mapping

All platform adapters map failures to the shared `FlareSdkError` shape:

```text
code
message
operation
retryable
details
cause
```

Stable error codes are generated from `sdk-spec/manifest.json`. Adapters must not collapse core failures into platform-generic exceptions without preserving the stable `code`.

## Observability

Runtime adapters should attach these values when available:

- `traceId`
- `sessionId`
- `operation`
- native handle id or equivalent local instance id
- SDK package version
- FFI contract version

Stable application semantics must use typed fields and enums. `metadata`, `extra`, and `details` remain opaque extension or diagnostic escape hatches.
