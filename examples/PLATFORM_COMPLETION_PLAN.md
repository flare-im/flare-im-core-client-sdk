# Platform Example Completion Plan

This document tracks the delivery order for platform example apps under
`flare-im-core-client-sdk/examples`.

## Delivery Phases

### Phase 1 - 一期先完成

These five apps should be completed together first. They cover the primary
production client surfaces and should align on the same SDK integration
capabilities before later platform expansion.

| App | Platform | Target |
|-----|----------|--------|
| [`flare-core-web-app`](./flare-core-web-app) | Web | Phase 1 / 一期先完成 |
| [`flare-core-tauri-app`](./flare-core-tauri-app) | Tauri | Phase 1 / 一期先完成 |
| [`flare-core-ios-app`](./flare-core-ios-app) | iOS | Phase 1 / 一期先完成 |
| [`flare-core-flutter-app`](./flare-core-flutter-app) | Flutter | Phase 1 / 一期先完成 |
| [`flare-core-android-app`](./flare-core-android-app) | Android | Phase 1 / 一期先完成 |

### Phase 2 - 二期

| App | Platform | Target |
|-----|----------|--------|
| [`flare-core-cangjie-app`](./flare-core-cangjie-app) | HarmonyOS Cangjie | Phase 2 / 二期 |
| [`flare-core-arkts-app`](./flare-core-arkts-app) | HarmonyOS ArkTS | Phase 2 / 二期 |

### Phase 3 - 三期

| App | Platform | Target |
|-----|----------|--------|
| [`flare-core-rn-app`](./flare-core-rn-app) | React Native | Phase 3 / 三期 |
| [`flare-core-electron-app`](./flare-core-electron-app) | Electron | Phase 3 / 三期 |
| [`flare-core-uni-app`](./flare-core-uni-app) | uni-app | Phase 3 / 三期 |

## Standalone Demo Repository Baseline

Phase 1 apps are intended to become standalone demo repositories that users can
download and run without relying on `../../native` from this monorepo. For that
distribution shape, keep `flare-im-core-client-sdk/native` as the canonical
workspace artifact snapshot and copy it into each demo app as `native/` before
publishing or extracting the demo repository.

Use the SDK root Makefile to distribute the snapshot:

```bash
make distribute-native-all
make distribute-native-web
make distribute-native-tauri
make distribute-native-ios
make distribute-native-android
make distribute-native-flutter
```

The copied `native/` directory solves the native artifact boundary only. Apps
that still depend on monorepo-local packages such as `../../packages/*` need a
separate dependency packaging pass before they are fully standalone.

## Completion Baseline

Each phase should converge on the shared example-app baseline documented in
[`README.md`](./README.md) and [`STRUCTURE.md`](./STRUCTURE.md):

- initialize and login
- subscribe SDK events
- list and open conversations
- send messages with callback handling
- sync conversations and messages
- inspect diagnostics, media cache, and presence
- dispose SDK resources cleanly
