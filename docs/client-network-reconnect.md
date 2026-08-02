# Client Network Reconnect

Platform SDKs report network reachability changes through the generated
connection API:

```ts
await client.connection.notifyNetworkChange({
  available: true,
  interface: "wifi",
  expensive: false,
  metered: false,
  reason: "path_changed",
})
```

The SDK operation is `connection.notify_network_change`. Core owns the active
reconnect behavior; this is the SDK's active reconnect entrypoint:

- If the network is unavailable, core records the condition and waits for a
  later available event.
- If there is no active SDK session, the call is a no-op and returns
  `reconnected = false`.
- If a session is active, core immediately rebuilds the long connection from
  the current reconnect snapshot instead of waiting for heartbeat timeout.
- Active network reconnect is single-flight inside core. Burst reachability
  callbacks are coalesced while one reconnect is already rebuilding the current
  session.

Platform code should not duplicate reconnect loops. It should only translate
OS reachability callbacks into `client.connection.notifyNetworkChange`.
`interface` is a typed `NetworkInterfaceKind` value: `unknown`, `wifi`,
`cellular`, `ethernet`, or `other`. Platform-specific raw interface names stay
out of the SDK protocol; put diagnostics in `reason` if needed.

## Verification

Run the lightweight gate:

```bash
cargo xtask network-reconnect
```

The gate is also part of `cargo xtask verify`. It checks the core reconnect
entrypoint, direct invoke contract, SDK API/model contract, no-session behavior,
and the single-flight reconnect regression test.
