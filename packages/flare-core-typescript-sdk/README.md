# @flare-im/sdk

English · [中文](README.zh-CN.md)

The TypeScript client SDK for Flare IM — a typed wrapper over the Rust core (`flare-im-core-sdk`).

All the real IM logic (connection, sync, storage, timeline) lives in the Rust
core; this package wires it onto the various JS runtimes and provides complete
TypeScript types.

## Install

```bash
npm install @flare-im/sdk
```

## Pick an entry point by runtime

Transport and storage capabilities differ per runtime, so the entry points are
split — import from the matching subpath:

| Runtime | Import path | Transport / storage |
|---|---|---|
| Browser / H5 | `@flare-im/sdk/web` | WebSocket (WASM) + IndexedDB |
| Tauri desktop | `@flare-im/sdk/tauri` | QUIC + SQLite |
| uni-app | `@flare-im/sdk/uni-app` | native core |
| React Native | `@flare-im/sdk/react-native` | native core |

```ts
import { FlareCoreSdk } from "@flare-im/sdk/uni-app";
```

Swap `/uni-app` for `/web` in the browser or `/tauri` for Tauri; the rest of
your code is unchanged.

> The Tauri entry point requires the peer dependency `@tauri-apps/api ^2.0.0`.

## Other subpaths

```ts
import { SdkOperations, SdkEvents } from "@flare-im/sdk/contract";
```

`api` / `listener` / `model` / `callback` / `contract` / `media` / `lifecycle`
export operations, event listeners, data models, callbacks, the protocol
contract, media, and lifecycle respectively.

## A complete, runnable example

This package is the SDK layer; running it needs the matching runtime bridge and
a server. For complete, runnable apps see [`examples/`](../../examples/) in the
repository — `flare-core-uni-app` is the most fully wired one.

For how to start the server, see `QUICKSTART.md` in the flare-im-core repository
(up and running in five minutes, no self-built user system required).

## For contributors

**Do not add IM business logic here.** Behavior belongs in `flare-im-core-sdk`
(Rust), exposed through `bindings/c`, then reflected in `sdk-spec/manifest.json`.
This package only does typed forwarding — pushing logic down into the core is
what lets all seven platforms share one implementation.

- Contract status: `contract-synced`
- Async model: Promise + event subscription
- FFI contract: `flare-im-ffi/v1`

## License

Apache-2.0
