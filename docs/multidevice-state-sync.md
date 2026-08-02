# Multi-Device State Sync

Flare keeps message data authoritative in core and exposes conversation state
through typed APIs. This document records the current production contract for
read state and drafts.

## Read State

Applications mark a conversation read through the generated conversation API:

```ts
await client.conversations.markRead({ conversationId, readSeq })
```

In platform idioms this maps to `conversation.markRead` /
`conversation.mark_read`. Core owns read-position rules:

- `ConversationReadService` clamps requested read seq to the effective local
  max seq.
- `ConversationEvent::UnreadCountChanged` is emitted after local state changes.
- `ReadStatesSyncTask` runs as a background sync task.
- `SyncProtocolAdapter::push_local_read_states` sends local read positions to
  the server using read ack payloads before summary sync.
- Burn/read acknowledgement uses the same `Ack.payload.read(ReadAck)` path.
  SDK send-side code does not emit `EventReadReceipt` for read state. `ReadAck`
  must carry `read_seq` and the current `config.effective_device_id()`.

This prevents client examples from recalculating read positions independently.

## Drafts

Applications update the local draft through:

```ts
await client.conversations.updateDraft({ conversationId, draft })
```

In platform idioms this maps to `conversation.updateDraft` /
`conversation.update_draft`. Core persists drafts through the local conversation
repository, refreshes views with `publish_updated`, then pushes the typed
`ConversationUserSettingsSync.draft` payload through the sync channel. The sync
orchestrator forwards it to the conversation service's
`UpdateConversationUserSettings.draft` command field and returns
`ConversationUserSettingsSyncRes.settings.draft` with the authoritative
settings version. Draft is a named protocol field, not metadata.

`ConversationSettingsSyncTask` retries locally dirty settings in the background.
Command and background paths both keep propagation errors visible; they do not
report draft/pin/mute/archive as a successful cloud roam unless the server
returns settings.

## Device Presence Logout

Presence logout is device-scoped. `IMClientBuilder` passes
`config.effective_device_id()` into the platform `PresenceApi`, and
`logout_current_device_presence` only logs out the online record whose
`device_id` exactly matches the current SDK device and has an active
`conversation_id`. It does not pick the most recently active device. This keeps
multi-device logout from accidentally kicking another logged-in phone, desktop,
or browser tab.

## Device Management

Device management is exposed at two layers:

- API Gateway exposes typed REST endpoints for product/admin integrations:
  `GET /api/v1/presence/users/{userId}/devices`,
  `GET /api/v1/presence/devices/{deviceId}`, and
  `POST /api/v1/presence/devices/{deviceId}/kick`.
- Core SDK `PresenceApi` exposes current-session user operations:
  `list_current_user_devices`, `get_device`, and `kick_device`.

`DevicePresenceDto` mirrors the online proto `DeviceInfo`: device identity,
platform/model/OS, last active time, priority, token version, typed connection
quality, online conversation id, gateway id, and server id. SDK device
management does not accept arbitrary target user ids; cross-user management
belongs to gateway/admin surfaces with their own auth and audit policy.

## Active Device Fanout

Online delivery is user-scoped and device-fanout aware. The transport
connection manager resolves all active connection ids for a user through
`get_user_connections`, snapshots those handles with `connection_handles_for_ids`,
and sends to every handle with bounded `fanout_concurrency`. SDK apps should not
poll or locally duplicate routing to make another logged-in device refresh.

## Typing State

Typing is a realtime best-effort control signal, not a durable sync record.
`message.typing` sends a typed `RealtimeControlPacket` with a
`TypingStatePacket` payload. Core now fills `device_id` from
`config.effective_device_id()`, so receivers can distinguish which logged-in
device is typing and collapse stale indicators correctly. Durable text-in-input
state remains the conversation draft and is synced through
`ConversationUserSettingsSync`.

## Multidevice Conformance Matrix

The Web and Flutter example apps share one conformance manifest:
`examples/multidevice_conformance.json`. It defines the cross-client scenarios
that must remain aligned:

- `message_fanout`
- `read_state_roaming`
- `draft_roaming`
- `device_kick`
- `typing_device_attribution`

Each scenario lists required setup, client entrypoints, execution steps, and
observable state. The manifest is intentionally client-neutral: core owns the
protocol behavior, while Web and Flutter tests only assert that their examples
are wired to the same scenarios.

## Verification

Run:

```bash
cargo xtask multidevice-state
```

The gate is also part of `cargo xtask verify`. It checks the read domain
service, read-state sync task, conversation settings sync payload, conversation
APIs, exact device presence logout, current-user device management, typing
device attribution, read ack device attribution, the absence of send-side
`ReadReceipt` transport events, active user fanout in the transport connection
manager, SDK spec operations, typed draft propagation, SQLite/IndexedDB state
persistence anchors, and the shared Web/Flutter conformance manifest.
