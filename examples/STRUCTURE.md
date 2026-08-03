# Examples Directory Structure

All platform example apps under `examples/` follow the same naming and layering conventions as `flare-core-flutter-app`.

## Naming

```text
flare-core-{platform}-app
```

| Platform   | Directory                 | SDK Package                         |
|------------|---------------------------|-------------------------------------|
| Flutter    | `flare-core-flutter-app`  | `packages/flare-core-flutter-sdk`   |
| Web        | `flare-core-web-app`      | `packages/@flare-im/sdk` (web) |
| React Native | `flare-core-rn-app`     | `packages/@flare-im/sdk` (react-native) |
| Android    | `flare-core-android-app`  | `packages/flare-core-android-sdk`   |
| iOS        | `flare-core-ios-app`      | `packages/flare-core-apple-sdk`     |
| HarmonyOS ArkTS | `flare-core-arkts-app` | `packages/flare-core-harmony-arkts-sdk` |
| HarmonyOS Cangjie | `flare-core-cangjie-app` | `packages/flare-core-harmony-cangjie-sdk` |
| uni-app    | `flare-core-uni-app`      | `packages/@flare-im/sdk` (uni-app) |
| Electron   | `flare-core-electron-app` | `packages/@flare-im/sdk` (web) |
| Tauri      | `flare-core-tauri-app`    | `packages/@flare-im/sdk` (`/tauri`) |

## Canonical Application Layers

Every app keeps IM product code in five layers. Platform-specific source roots differ, but responsibilities stay the same.

```text
application/      # state orchestration, SDK event bridge, use-case wiring
domain/           # entities, value objects, repository interfaces
infrastructure/   # SDK adapters, mappers, local storage, media I/O
interface/        # routes/pages/screens, theme, reusable IM UI components
shared/           # config, DI, network, theme tokens, logging
```

Supporting directories:

```text
assets/           # emoji, stickers, default config JSON
scripts/          # FFI sync, platform bootstrap helpers
test/             # unit / widget / integration tests
```

## Platform Source Roots

| Platform | Primary source root | Entry |
|----------|---------------------|-------|
| Flutter  | `lib/`              | `lib/main.dart` |
| Web / Electron / Tauri / RN / uni-app | `src/` | platform-specific bootstrap |
| Android  | `app/src/main/kotlin/com/flare/im/` | `app/.../app/MainActivity.kt` |
| iOS      | `Sources/FlareImApp/` | `Sources/FlareImApp/App/FlareImApp.swift` |
| ArkTS    | `entry/src/main/ets/` | `entry/.../app/EntryAbility.ets` |
| Cangjie  | `src/`              | `src/app/Main.cj` |

## Web App Layer Mapping

`flare-core-web-app` predates the DDD folder split. Current paths map to layers as follows:

| Layer | Current path |
|-------|--------------|
| `interface/` | `src/views/`, `src/layouts/`, `src/chat/components/`, `src/router/` |
| `application/` | `src/composables/`, `src/chat/composables/` |
| `domain/` | `src/chat/types/`, `src/chat/constants/` |
| `infrastructure/` | `src/sdk/`, `src/config/` |
| `shared/` | `src/theme/`, `src/styles/`, `src/chat/config/` |

New TypeScript-based apps should use the canonical `src/{application,domain,infrastructure,interface,shared}` layout from day one.

## Required Capabilities Checklist

Each example app must eventually cover the same integration path:

- SDK initialize and login
- subscribe SDK events
- list and open conversations
- send messages with callback handling
- sync conversations and messages
- diagnostics, media cache, and presence entry points
- dispose SDK resources cleanly

Reference implementation: `flare-core-flutter-app`.

## Scaffold

Regenerate empty platform scaffolds:

```bash
bash examples/scaffold_platform_apps.sh
```

Existing full apps (`flare-core-flutter-app`, `flare-core-web-app`) are not overwritten.
