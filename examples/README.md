# Examples

Example applications are production-oriented client templates. They follow the same naming and DDD layering as `flare-core-flutter-app`. See [`STRUCTURE.md`](./STRUCTURE.md) for the full convention.

Each app must eventually show the full SDK integration path a real product needs:

- initialize and login
- subscribe SDK events
- list and open conversations
- send messages with callback handling
- sync conversations and messages
- inspect diagnostics, media cache, and presence
- dispose SDK resources cleanly

## Canonical Reference

| App | Platform | SDK | Status |
|-----|----------|-----|--------|
| [`flare-core-flutter-app`](./flare-core-flutter-app) | Flutter | `flare-core-flutter-sdk` | Full IM workbench |
| [`flare-core-web-app`](./flare-core-web-app) | Web (Vue 3) | `@flare-im/sdk` (web) | Full IM workbench |

## Platform Scaffolds

Scaffold apps share the five-layer layout (`application` / `domain` / `infrastructure` / `interface` / `shared`). Implementation is incremental; use Flutter and Web as behavioral references.

| App | Platform | SDK |
|-----|----------|-----|
| [`flare-core-rn-app`](./flare-core-rn-app) | React Native | `@flare-im/sdk` (react-native) |
| [`flare-core-android-app`](./flare-core-android-app) | Android (Kotlin) | `flare-core-android-sdk` |
| [`flare-core-ios-app`](./flare-core-ios-app) | iOS (SwiftUI) | `flare-core-apple-sdk` |
| [`flare-core-arkts-app`](./flare-core-arkts-app) | HarmonyOS ArkTS | `flare-core-harmony-arkts-sdk` |
| [`flare-core-cangjie-app`](./flare-core-cangjie-app) | HarmonyOS 仓颉 | `flare-core-harmony-cangjie-sdk` |
| [`flare-core-uni-app`](./flare-core-uni-app) | uni-app | `@flare-im/sdk` (uni-app) |
| [`flare-core-electron-app`](./flare-core-electron-app) | Electron | `@flare-im/sdk` (web) |
| [`flare-core-tauri-app`](./flare-core-tauri-app) | Tauri | `@flare-im/sdk/tauri` |

## Directory Layout

```text
flare-core-{platform}-app/
├── README.md
├── scripts/              # FFI sync, platform bootstrap
├── assets/ or Resources/ # emoji, stickers, default config
└── {source root}/        # lib/ | src/ | Sources/ | entry/.../ets/
    ├── application/
    ├── domain/
    ├── infrastructure/
    ├── interface/
    └── shared/
```

Regenerate scaffolds (does not overwrite Flutter/Web full apps):

```bash
bash examples/scaffold_platform_apps.sh
```
