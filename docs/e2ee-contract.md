# E2EE Contract

Flare E2EE is a core-owned contract with pluggable cryptographic
implementations. The SDK does not hard-code a ratchet or MLS implementation;
it owns the policy, fail-closed send interception, typed ciphertext envelope,
and server-visible privacy semantics.

## SDK Contract

The application enables E2EE through:

```rust
IMClientBuilder::conversation_encryption(policy_resolver, content_codec)
```

The resolver returns `ConversationEncryptionPolicy`. When the policy tier is
`EncryptionTier::E2e`, `ContentEncryptionInterceptor` requires non-empty
plaintext `MessageContent`, passes it to the configured `ContentCodec`, and
replaces the outbound content with a typed placeholder:

- `E2EE_PLACEHOLDER_REASON = "e2e_ciphertext"`
- `E2EE_CONTENT_TYPE = "application/vnd.flare.e2ee-message.v1"`
- `PLAINTEXT_CONTENT_TYPE = "application/vnd.flare.message-content.v1"`

If the codec namespace is wrong, plaintext is empty, or ciphertext is empty,
the send path fails before transport. This keeps encryption behavior in core
instead of letting clients silently fall back to plaintext.

For production E2EE, use `KeyManagedConversationEncryptionPolicyResolver`.
It queries `E2eeKeyManager::session_for_conversation` before send and fails
closed when the conversation has no established session, when the returned
session belongs to another conversation, when `device_session_id` is empty, or
when neither `key_id` nor `sender_key_id` is present. The resulting policy
feeds suite, key id, sender key id, and device session id into the encrypted
placeholder envelope for the concrete `ContentCodec` to resolve key material.

`VolatileE2eeKeyManager` is the SDK-provided in-memory key/session state
manager for tests, demos, and host integration bring-up. It validates identity
keys, pre-key bundles, and session descriptors, and it refuses to establish a
missing session with a synthetic algorithm. A production E2EE provider must
derive and persist sessions itself, then expose them through `E2eeKeyManager`.

## Key SPI

`E2eeKeyManager` is the stable SPI for identity keys, pre-key bundles,
conversation sessions, and device-session revocation. Concrete choices such
as MLS or a double-ratchet provider plug in behind this SPI and `ContentCodec`.

The current contract supports:

- Local identity key publication.
- Pre-key bundle publication.
- Per-conversation device-session establishment.
- Session lookup before send.
- Device-session revocation.
- Strict in-memory session/pre-key state validation through
  `VolatileE2eeKeyManager`.
- Send-time session enforcement through
  `KeyManagedConversationEncryptionPolicyResolver`.

## Push Privacy

Server push cannot assume plaintext is available. Getui push handling checks
the typed E2EE placeholder and content visibility:

- `message_has_e2ee_placeholder`
- `ContentVisibility::Hidden`
- `ContentVisibility::Redacted`
- `ContentVisibility::Purged`

For encrypted or hidden content, push uses a generic notification even when a
message carries `OfflinePushInfo`. Non-E2EE visible messages may still use
typed push preview data.

## Verification

Run:

```bash
cargo xtask e2ee-contract
```

The gate is also part of `cargo xtask verify`. It checks SDK policy/interceptor
anchors, public exports, and Getui privacy handling.
