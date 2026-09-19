# Flare SDK Reference App UI Migration Report

## 1. Migration summary

The Web, Tauri, Flutter, Android, and iOS SDK examples now act as consumers of the current Flare UI packages. Reusable navigation, application shells, conversation/message presentation, composer controls, dialogs, menus, image preview, semantic state, theme, and responsive behavior are owned by `flare-im-design`. The examples retain SDK setup, model mapping, state, routing, lifecycle, and platform bridges. Their product boundary is deliberately limited to conversations and messages; contact directories, group directories, and relationship graphs are not exposed.

Final audit result: all five examples use public UI APIs, all three example architecture gates pass, all executable example tests and builds pass, all 32 design-system gates pass, and no P0, P1, or actionable P2 migration issue remains.

## 2. Latest component library version/path

| Consumer | Package | Version | Workspace source |
| --- | --- | --- | --- |
| Web / Tauri | `@flare-im/vue-ui` | `2.0.0-rc.1` | `flare-im-design/packages/vue-im-ui` |
| Web / Tauri | `@flare-im/tokens` | `2.0.0-rc.1` | `flare-im-design/tokens` |
| Flutter | `flare_im_ui` | `2.0.0-rc.1` | `flare-im-design/packages/flutter-im-ui` |
| Android | `com.flare.im:im-ui-compose` | `2.0.0-rc.1` | `flare-im-design/packages/android-im-ui` through Gradle composite substitution |
| iOS | `FlareIMUI` | `2.0.0-rc.1` workspace state | `flare-im-design/packages/ios-im-ui` through SwiftPM path dependency |

No target example references an older UI package, copied package source, or package-private UI path.

## 3. Web migration

- `flare-core-web-app` is now a Vue 3 PC/H5 reference consumer assembled with public `FlareIMAppKit`, adaptive navigation, conversation/list/message primitives, composer, message/conversation search, media, settings, status, forms, and image preview.
- Chats, Search, Media, Settings, and SDK Lab are reachable from one configuration-driven navigation contract. SDK Lab is a custom host navigation item rather than a component fork.
- `examples/shared/vue-reference/ReferenceApp.vue` owns product composition and `useReferenceSdkAdapter.ts` maps public SDK models/events to UI contracts. It supports server-free demo data and real Web SDK connection without cloning the component gallery.
- The Web runtime still uses `WebFlareImClient`, `WebProductionBridge`, and the WASM runtime. Router behavior and SDK configuration remain in the example.
- Desktop and mobile selection, send, search, media preview, theme switching, and navigation flows are covered by Playwright.

## 4. Tauri migration

- Tauri consumes the same shared Vue reference composition as Web, so desktop UI semantics no longer drift into a second implementation.
- `src/integration/referenceRuntime.ts` creates the real Tauri SDK client and supplies host commands for file picking and unread count updates.
- Rust/Tauri window, tray, native command, filesystem, notification, unread badge, and transport behavior remain in the platform layer.
- Desktop resize, drag/drop entry points, keyboard-capable public components, and native bridge boundaries are retained without embedding Tauri logic in the UI package.
- Frontend typecheck/tests/build and Rust `cargo check` pass; no native GUI automation result is claimed.

## 5. Flutter migration

- Flutter now uses public `FlareIMAppKit` for mobile/tablet/desktop application composition and the shared navigation/responsive contracts.
- Conversation rows, composer, message bubble, message content, context menu, dialog, and image preview delegate to `flare_im_ui`. Local files with adapter names translate SDK/domain/media data and do not redraw those components.
- The former large custom long-press surface is a 222-line intent adapter over `FlareMessageContextMenu` and `FlareDialog`; reply, forward, recall, multi-select, mark, pin, self-pin, copy, edit, delete, and reactions remain available according to host callbacks.
- Riverpod state, GoRouter routes, SDK wrapper, upload/media resolution, authenticated image loading, drafts, and platform services remain example responsibilities.
- Flutter analyze, 71 app tests, and a macOS debug application build pass.

## 6. Android migration

- The Compose app consumes public `IMAppKit`, adaptive navigation, responsive mode resolution, `MessageBubble`, `Composer`, `ImagePreview`, and shared empty/state presentation.
- `FlareAppStore`, `AppSession`, domain mappers, ViewModels, Android lifecycle, connectivity, permissions, audio, and native image bridges remain outside the UI package.
- Reusable message content renderers were removed; the remaining row/content files resolve SDK payloads and pass presentation data or host image content into public UI components.
- Contact, group-directory, and relationship destinations are absent by product scope. Media-center and Calls capabilities that are not implemented remain unavailable rather than being faked.
- Unit tests, Compose/UI package tests used by the workspace, lint, and debug APK assembly pass.

## 7. iOS migration

- The SwiftUI app consumes public `IMAppKitView`, adaptive navigation, `MessageBubbleView`, `FlareIMUI.ComposerView`, `ImagePreviewView`, empty/state presentation, and shared theme/token contracts.
- `AppSession`, SDK client factory, model mapping, view models, SwiftUI route state, sheets, clipboard, media upload, audio session, and native image handling remain host concerns.
- The former message bubble/media/rich-view UI island was removed. `MessageRowViews.swift` is now the SDK-to-public-message adapter plus host action wiring.
- Contact, group-directory, and relationship destinations are absent by product scope. Media-center and Calls capabilities that are not implemented remain unavailable instead of simulated.
- Swift build and 53 app tests pass; six explicitly environment-dependent FFI/live-backend tests are skipped with reasons.

## 8. Removed duplicate UI

The migration removed or keeps absent the following known duplicate UI islands:

- Web and Tauri local `src/views` implementations.
- Flutter `message_bubble.dart`, `content_view.dart`, `message_style.dart`, and the message `views/` renderer directory.
- iOS `MessageBubbleViews.swift`, `MessageMediaViews.swift`, and `MessageRichViews.swift`.
- Android per-content message renderers replaced by the public `MessageBubble`/content host boundary.

Composer, ConversationItem, AppShell, Navigation, Dialog/Menu, and ImagePreview entry points now delegate to package symbols on every applicable platform. `example-no-duplicate-ui` fails if a removed island returns or a required public delegate disappears.

## 9. Removed legacy styling

- Web/Tauri legacy page, message, layout, navigation, button, and preview styling left with the deleted local views. The shared reference app only contains composition-level sizing and host glue.
- Flutter reusable bubble, menu, composer, navigation, spacing, and layout visuals moved to `flare_im_ui`; host theme/config and platform media code remain only where the application must bridge Flutter services.
- Android retains an app-level Material/theme bridge, while reusable colors, message shapes, component states, and dimensions come from generated Compose tokens/components.
- iOS retains app-level color-scheme selection and native presentation bridges, while reusable SwiftUI tokens and component styling come from `FlareIMUI`.
- No old UI package, old token package, legacy stylesheet, second reusable design system, or directory/relationship presentation is referenced by the five targets.

## 10. Component library gaps discovered

| Gap found through real app assembly | Affected consumer |
| --- | --- |
| Application configuration, adaptive navigation, responsive pane selection, workspace frame, and AppKit surfaces were not uniformly public across native packages | Flutter, Android, iOS |
| Generic capability-driven message context menu was missing | Flutter |
| Image preview needed a host-provided authenticated/local image builder | Flutter |
| Composer parts required public package exports for thin adapters | Flutter |
| Sticker content needed public `src` parity while preserving an explicit image override | Flutter |
| Theme provider did not react to changed mode/brand props | Vue |
| Select trigger lacked an accessible name/state contract | Vue |
| Bottom navigation could overflow with seven reference destinations, and fallback icon names could render as text | Vue |

No gap was solved by adding reusable presentation only inside an example.

## 11. Component library changes made

- Added and publicly exported native application composition/AppKit contracts needed by the reference apps, including navigation groups/items/badges, capability/feature configuration, responsive mode resolution, and pane composition.
- Added public Flutter composer surfaces and `FlareMessageContextMenu`, with action/reaction result contracts, tests, and exports.
- Extended Flutter image preview with a public `imageBuilder` host boundary and added `FlareStickerMessage.src` while keeping the supplied image widget authoritative.
- Added or exposed Android and iOS public message bubble and image preview adapters required for host-resolved media.
- Made Vue theme mode/brand props reactive, added Select ARIA labeling/state, corrected canonical navigation icon names, and made mobile navigation distribute seven items without overflow.
- Updated specs, bilingual component/example documentation, website navigation, generated catalogs, repository inventory, and tests. Generation and all 32 design-system checks pass with 153 stable components.

## 12. Adapter architecture

The implemented boundary is:

`SDK -> Example adapter/store -> UI contracts + capabilities -> Flare IM UI -> AppKit/workspaces`

| Platform | Adapter boundary |
| --- | --- |
| Web/Tauri | `useReferenceSdkAdapter.ts` maps public `Conversation`/`Message`, installs/removes public SDK event subscriptions, and exposes intents; each runtime supplies client/platform commands. |
| Flutter | SDK wrapper, repositories, Riverpod providers/selectors, and thin UI adapters map domain entities into package contracts; GoRouter handles route intents. |
| Android | `AppSession`, `FlareAppStore`, `SdkModelMapper`, and ViewModels map Flow/event data; Compose screens bind state and dispatch host intents. |
| iOS | `AppSession`, `SdkModelMapper`, environment objects, and feature view models map SDK state; SwiftUI views dispatch route/platform intents. |

UI packages do not import SDK internal models, initiate SDK connections, own persistence, or perform platform side effects. Subscription cleanup/disposal remains explicit in each runtime and was preserved during the UI replacement.

## 13. Theme integration

- The source of truth is the generated Flare semantic token/theme contract: 56 colors across six brands and two modes, plus 57 size tokens.
- Violet, Ocean, Forest, Sunset, Rose, and Graphite are available with Light/Dark behavior. The Web reference exposes both selectors and persists the choice; `FlareUiProvider` now updates after prop changes.
- Flutter, Compose, and SwiftUI consume their generated package tokens through platform-idiomatic theme providers or app-level color-scheme bridges.
- Message bubbles, statuses, selected states, focus, spacing, radii, and elevation are package-owned semantics. Examples do not override them with a competing palette.
- The theme gate validates all six brands in both modes and shared message semantics across four UI targets.

## 14. Responsive result

- Web is verified at 390, 768, 1024, and 1440 px. Mobile uses a single-pane flow and bottom navigation; larger modes expose master/content/detail space through AppKit.
- Tauri shares the adaptive Vue composition and responds to window resizing while retaining desktop platform behavior.
- Flutter resolves package responsive modes with text scale and assembles mobile, tablet, and desktop from one `FlareIMAppKit` shell.
- Android resolves the shared mode from Compose constraints and uses the package's mobile/rail/workspace behavior.
- iOS resolves the shared mode from `GeometryReader` and selects the appropriate primary/content pane without duplicating screen implementations.
- Component tests additionally cover constrained 320/390 layouts, large text, dialogs/composer, and three H5 image-preview viewports.

## 15. Image preview result

- Web and Tauri use public `FlareImagePreview`; host code supplies local/SDK-resolved URLs and download intent. Fit, decoded dimensions, visible opacity, viewport containment, close/focus restoration, zoom controls, error/retry states, and visual-viewport behavior remain component-owned.
- Flutter uses public `FlareImagePreview`; the new `imageBuilder` allows authenticated/local SDK media without forking preview chrome or interaction.
- Android uses public `ImagePreview` with host-resolved content, and iOS uses public `ImagePreviewView` with the native image bridge.
- Website Playwright verifies decoded image geometry at 375x667, 390x844, and 430x932. The Web reference flow also opens and closes media preview in desktop/mobile scenarios.

## 16. Tests

| Scope | Result |
| --- | --- |
| Example architecture | `example-no-duplicate-ui`, `example-public-api-check`, and `real-sdk-example-assembly-check` pass |
| Web | Typecheck and 40 Vitest tests pass; 5 Playwright flows pass across desktop/mobile widths |
| Tauri | Typecheck and 5 frontend/platform-contract tests pass |
| Flutter app | Analyze passes; 71 tests pass |
| Android app | Debug unit tests and lint pass |
| iOS app | 53 tests execute with 47 pass, 6 environment-gated skips, and 0 failures |
| Vue UI | 39 files / 254 tests pass; 197 SFCs compile |
| Flutter UI | Analyze passes; 348 tests pass |
| iOS UI | 168 tests pass |
| Design system website | 31 Playwright tests pass in the final isolated full run |
| Independent consumers | Packed Vue, Flutter, Compose, and Swift package consumer fixtures all pass |
| Design-system gates | 32/32 pass, including signatures, exports, tokens, accessibility, docs, visual/performance contracts, resources, and website build |

## 17. Builds

| Target | Verified build |
| --- | --- |
| Web | Vite production build; every JS chunk is within the 800 KiB budget |
| Tauri | Vite production build within the 1400 KiB budget plus Rust `cargo check` |
| Flutter | macOS debug app at `build/macos/Build/Products/Debug/flare_im.app` |
| Android | Debug APK assembly (`:app:assembleDebug`) |
| iOS | SwiftPM debug build |
| Design website | VitePress production build |
| Package distribution | Tarball/path/local-Maven/SwiftPM consumer builds for all four UI implementations |

`git diff --check` is part of the final repository audit below and must remain green with the generated artifacts current.

## 18. Remaining platform limitations

- Tauri native GUI automation is not available in the current harness; frontend integration/build and Rust checks are the verified boundary.
- Android instrumentation on a physical/emulated device and iOS simulator UI automation were not run. Unit, semantic/package, lint, and available build checks pass.
- Six iOS app tests require a synced FFI dylib, a running local service, or `FLARE_E2E_*` credentials and therefore remain explicitly skipped by environment.
- Flutter reports that the existing iOS/macOS hosts still include CocoaPods integration even though current plugins are available through Swift Package Manager. This is an upstream host-project cleanup warning, not a failed UI build.
- Contact directories, group directories, and relationship graphs are intentionally out of scope on every platform. Group conversations remain valid messaging targets. Other absent media-center, call, or platform operations remain disabled/N/A and are not backed by fake data in real mode.
- At library level, `ConfigProvider` remains Vue-only and `DesktopWorkbench` remains Vue-only by contract; native consumers use their idiomatic theme providers and AppKit composition. This yields 100% Vue, 99.3% Flutter, and 98.7% iOS/Compose catalog coverage without signature drift.

## 19. Remaining P2/P3

**P2:** None remaining from the migration audit. All obvious P2 issues found during assembly, including reactive theme updates, Select naming, bottom-navigation overflow, fallback icons, authenticated preview loading, native AppKit surfaces, duplicate message/menu UI, and removal of directory/relationship navigation, were resolved and covered by gates or tests.

**P3:**

- Migrate the existing Flutter iOS/macOS host projects fully from CocoaPods to Swift Package Manager when the host build policy is updated.
- Add Tauri desktop GUI automation and Android/iOS device UI suites when stable runners are available.
- Run the six conditional iOS FFI/live-backend tests and equivalent remote SDK flows in a credentialed integration environment.
- Keep the three example gates and the 32 design-system gates required in CI so package-private imports, duplicate UI islands, generated drift, or SDK/AppKit disconnection cannot regress.
