# Channel And Large Conversation Capability

Channel and broadcast conversations are typed core protocol concepts, not
client-side conventions. The SDK and server use `ConversationType::Channel`
and `ConversationType::Broadcast` with explicit route ids and the large
conversation notify+pull path for high fanout.

## Conversation Types

`ConversationType` is aligned with the core wire contract:

- `ConversationType::Channel`
- `ConversationType::Broadcast`

Both use the subscriber model. Their route id is stored in `channel_id` and is
required at creation time:

- Channel requires `channel_id`.
- Broadcast requires `broadcast_id`.

The service must not synthesize random route ids for channel or broadcast
creation. Missing route id is an invalid parameter error.

## Large Conversation Delivery

Large conversations use the typed `large_conversation` delivery flag and the
notify+pull path. This avoids materializing push recipients for every member:

- Main message storage remains the durable source.
- Push sends a lightweight ping for clients to pull the changed range.
- The user sync/version path supplies recovery for offline devices.

This keeps Channel/large-group semantics in server/core rather than in each
platform client.

## SDK Surface

SDK models and generated platform SDKs expose `channel` and `broadcast` as
strict string enum values. Clients should filter or render these values, but
must not infer conversation identity from ad hoc metadata.

## Verification

Run:

```bash
cargo xtask channel-capability
```

The gate is also part of `cargo xtask verify`. It checks SDK enum policy,
sdk-spec values, generated TypeScript enum output, server creation validation,
and large conversation fanout anchors.
