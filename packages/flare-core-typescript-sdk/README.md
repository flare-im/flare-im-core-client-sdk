# Flare Core SDK TypeScript Client

This package is a typed adapter over `flare-im-core-sdk/bindings/c`.

- Status: `contract-synced`
- Async model: Promise + event subscription
- FFI contract: `flare-im-ffi/v1`

Do not add IM business logic here. Add behavior to `flare-im-core-sdk`, expose it through `bindings/c`, then update `sdk-spec/manifest.json`.
