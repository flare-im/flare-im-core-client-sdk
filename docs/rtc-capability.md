# RTC Capability

Flare RTC is exposed as an optional capability/plugin path. Core IM remains
transport-agnostic; call signaling and SFU media commands are routed through
`client.capabilities` and the `rtc.*` namespace.

## SDK Capability Surface

The core SDK provides typed helpers over capability dispatch:

- `rtc.call.audio`
- `rtc.call.video`
- `rtc.call.accept`
- `rtc.call.end`
- `rtc.call.reject`
- `rtc.call.join_token`
- `rtc.media.join`
- `rtc.media.leave`
- `rtc.media.sdp.offer`
- `rtc.media.sdp.answer`
- `rtc.media.ice.candidate`
- `rtc.media.subscription.set`
- `rtc.media.room.state`

`RtcSfuSubscriptionRequest` is the typed request for subscription control.
Platform plugin APIs generated from the AV manifest delegate to the same
capability IDs, so adding RTC operations does not require new FFI symbols.
The `inputSchema` attached to each RTC operation is the host/plugin contract;
it follows `flare-im-core-sdk/src/extension/capability/rtc_ids.rs` exactly and
uses snake_case payload fields such as `call_id`, `room_id`, `sdp_offer`,
`candidate_json`, and `subscriber_peer_id`.
Each operation also declares an `outputSchema` aligned with the capability
service dispatch result fields:

- calls return `call_id` and, for newly created calls, `room_id`;
- join-token issuance returns `sfu_join_token` and
  `sfu_join_token_ttl_seconds`;
- SFU room join returns `room_id`, `peer_id`, `session_id`, and `call_id`;
- SDP / ICE / subscription commands return explicit `sdp_answer`, `accepted`,
  or `applied` flags;
- room-state queries return `room_id`, `exists`, `revision`, and optional
  `room_snapshot_json` / `room_snapshot`.

## Plugin Package

`../flare-sdk-plugin/flare-sdk-plugin-call/plugin.json` declares the `rtc`
namespace, permissions, operations, `inputSchema`, `outputSchema`, typed events,
and UI kit entrypoints. Generated platform stubs live under
`../flare-sdk-plugin/generated/sdk_plugin_av`.

RTC lifecycle events are typed:

- `rtc.call.invited` carries `call_id`, `conversation_id`,
  `caller_user_id`, and `media`.
- `rtc.call.accepted` carries `call_id`, `conversation_id`, and
  `accepted_by_user_id`.
- `rtc.call.ended` carries `call_id`, `conversation_id`,
  `ended_by_user_id`, and a finite `reason`.
- `rtc.media.room.updated` carries `room_id` and `revision`, with optional peer
  delta arrays.

The plugin package is currently distributed at composition time. Runtime
download/install, signature verification, and marketplace billing are tracked
separately under the plugin marketplace runtime-install work.

## SFU Service

`../flare-plugin/flare-strom-sfu` is the server-side RTC capability service
workbench. It provides:

- WebSocket JSON signaling.
- str0m-based media worker scaffolding.
- SDP and ICE command handling.
- Room, peer, track debug APIs.
- Optional Prometheus metrics via `GET /api/metrics`.

This is the current SFU foundation. Screen sharing, recording, weak-network
SVC, and production-grade runtime install remain separate RTC roadmap items.

## Verification

Run:

```bash
cargo xtask rtc-capability
```

The gate is also part of `cargo xtask verify`. It checks RTC capability IDs,
typed SDK helpers, AV plugin manifest/stubs, and strom SFU service anchors.
