# Flare IM Core Client SDK

This workspace contains typed client SDK adapters for `flare-im-core-sdk`.

The Rust core remains the only place for IM behavior. This workspace owns platform API shape, generated contracts, native artifact placement, docs, examples and contract tests.

## Architecture

```text
App
  -> L3 typed platform facade
  -> L2 runtime adapter
  -> L1 C ABI: ../flare-im-core-sdk/bindings/c
  -> L0 Rust core: ../flare-im-core-sdk
```

## Directory Map

```text
sdk-spec/        split contract source of truth
native/          C ABI index and produced native artifacts
packages/        platform SDK packages
examples/        platform smoke apps
docs/            generated and hand-written SDK docs
```

## Commands

```bash
make help
make all
make check

cargo xtask verify
cargo xtask sync-spec
cargo xtask codegen
cargo xtask wire-boundary-check
```

Common `make` targets:

- `make codegen`: regenerate SDK contracts **and sync official/docs/sdk** (11, 17, client-platform-api.json).
- `make spec`: validate split spec invariants.
- `make verify`: validate spec, core-contract parity, and package structure.
- `make all`: sync spec, verify, regenerate packages, and verify structure.
- `make codegen-check`: verify generated SDK outputs are up to date.
- `make wire-boundary-check`: verify Rust-owned wire boundary artifacts.
- `make check`: run spec/codegen/structure plus TypeScript, Dart, Swift, and optional Cangjie checks.
- `make clean`: remove local package/tool build caches.

## Rules

- Update `sdk-spec/modules/*.json` before changing public SDK APIs.
- Never duplicate message, conversation, sync, delivery, auth, presence, media, call or plugin business rules in platform packages.
- Keep platform wrappers thin: validate input, call C ABI, map result, emit typed event or typed error.
- Generated files are disposable. Do not edit generated files by hand.

## Production Contracts

- Runtime behavior: `docs/runtime-contracts.md`
- Architecture review and next steps: `docs/architecture-review.md`
