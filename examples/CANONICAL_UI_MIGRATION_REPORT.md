# Canonical UI Migration Report

Status: **INCOMPLETE**. Execution/audit date: 2026-09-11.
Scope: Web, Tauri, Flutter, Android, iOS and their public design-kit dependencies.
This report supersedes older adoption claims, not the application's behavior.
Independent app repositories and unrelated working-tree changes were preserved.
No deployment, commit or push was performed in this migration.

## 1. Migration Goals

Reusable visuals, tokens, layout, interaction and accessible presentation belong
in `flare-im-design`. Examples own SDK initialization, sessions, adapters,
capabilities, routes and platform bridges. Web is the functional reference;
native targets should share semantics, not HTML or pixel geometry.

The pass condition is actual canonical runtime rendering, not an import count.
This execution progressed through all five apps, library changes, ownership
gates, builds, documentation and audit. It did not finish every migration gap.

## 2. Reference Feature Matrix

SUPPORTED means an integration path exists, not that every variant passed E2E.
PARTIAL means incomplete capability coverage, legacy presentation or missing
platform validation. Tauri uses the same composition as Web, but native IPC,
files, recording and notifications still require GUI workflow testing.

| Feature | Web | Tauri | Flutter | Android | iOS |
| --- | --- | --- | --- | --- | --- |
| App Shell | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED |
| Navigation | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED |
| Chats | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED |
| Conversation List | SUPPORTED | SUPPORTED | PARTIAL | PARTIAL | PARTIAL |
| Conversation Header | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED |
| Message Timeline | SUPPORTED | SUPPORTED | PARTIAL | PARTIAL | PARTIAL |
| Composer | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Message Actions | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Reaction | SUPPORTED | PARTIAL | SUPPORTED | PARTIAL | PARTIAL |
| Reply | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Edit | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Recall | SUPPORTED | PARTIAL | SUPPORTED | SUPPORTED | SUPPORTED |
| Forward | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Multi-select | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Read Status | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED |
| Sticker | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Emoji | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Image | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Video | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Voice | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| File | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Contacts / Relationships | N/A | N/A | N/A | N/A | N/A |
| Group Directory / Administration | N/A | N/A | N/A | N/A | N/A |
| Group Conversations | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED | SUPPORTED |
| Search | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Media Workspace | PARTIAL | PARTIAL | MISSING | MISSING | MISSING |
| Image Preview | SUPPORTED | PARTIAL | SUPPORTED | SUPPORTED | SUPPORTED |
| Settings | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Theme (six brands x two modes) | PARTIAL | PARTIAL | PARTIAL | PARTIAL | PARTIAL |
| Offline | SUPPORTED | PARTIAL | SUPPORTED | SUPPORTED | SUPPORTED |
| Reconnect | SUPPORTED | PARTIAL | SUPPORTED | SUPPORTED | SUPPORTED |
| Loading | SUPPORTED | SUPPORTED | PARTIAL | PARTIAL | PARTIAL |
| Empty | SUPPORTED | SUPPORTED | PARTIAL | PARTIAL | PARTIAL |
| Error / Retry | SUPPORTED | PARTIAL | PARTIAL | PARTIAL | PARTIAL |

Directory N/A follows the established Core-only product scope, not a platform
limitation. No Social adapter was added. If directory support is mandatory for
the new reference standard, these cells become MISSING until a real Social
adapter is supplied; they cannot contribute to a COMPLETE claim.
Group conversations remain supported messaging targets. Missing native media
workspaces are integration work, not N/A.

## 3. Web Result

Vue 3 / TypeScript / Web WASM. The full workbench moved from `src/workbench`
to `examples/shared/vue-reference/workbench`. The host now injects its real
Web client; shared routing retains login, sync, conversations, chat and SDK Lab.
The simplified demonstration adapter was removed rather than substituted for
the working real application.

Public ChatWorkspace now owns composer measurement and timeline reservation.
Forward/payload/settings dialogs use FormSheet and public fields; forwarding
uses ForwardPicker. Sync and login feedback use EmptyState/StatusBanner.
Chat geometry, modal and settings CSS were removed from examples.

Still incomplete: the shared workbench remains large; account menu and search
composition contain legacy structures/classes. Successful static Web checks do
not prove zero reusable UI implementation. The dedicated media/settings
workspace target and complete six-brand behavior are not fully verified.

## 4. Tauri Result

Vue 3 / Tauri 2 now uses the same full workbench and router as Web.
`referenceRuntime.ts` injects `FlareCoreSdk.createClient()`, registers scoped
native path picking, media URL resolution, transport capabilities, desktop
notifications and unread integration. No Web client fallback exists.

Vite dependency deduplication fixes shared-source resolution for Vue/router,
Naive UI, icon, Markdown and protobuf dependencies. Native Rust commands,
window/tray integration and notification lifecycle remain in the Tauri host.

Frontend tests/build and cargo check pass. Actual native GUI workflows and a
packaged installer were not verified; shared Vue source alone is not that proof.

## 5. Flutter Result

Riverpod / GoRouter / native SDK retained. Chat AppBar and the local presence
pill were replaced by public FlareConversationHeader while preserving search,
selection commands, details, synchronization actions and the call bridge.
Reaction ActionChip layout now delegates to FlareReactionSummary.
The message adapter uses current row-presentation contracts; an obsolete
groupStart argument was removed. The emoji locale asset symlink was repaired.

Conversation details now use the public Avatar instead of a local palette.
Unused theme/message/login geometry constants were deleted. Material ThemeData
is a platform color-scheme adapter; no custom input/card/button style system
remains in that file. Legacy fixed-light aliases still exist in old screens.

ChatScreen is still 2,126 lines. Composer sheets, reply strip, preview fragments,
search, menu and details presentation are not fully migrated. A public bubble
delegate does not make those surrounding render paths canonical.

## 6. Android Result

Compose / Flow / ViewModels and the real Android SDK retained. ChatView now uses
public ConversationHeader with identity and capability-driven search/back.
The app no longer treats its own SDK connection as the peer's online status.
Local outgoing foreground and spacing/font literals in the theme bridge now
delegate to kit tokens; the letter-spacing override was removed.

Local FlareType roles, search sheet, menus, conversation and composer fragments
remain. Unit/lint/assemble tasks pass. Instrumentation compilation reports
NO-SOURCE, and no device was attached: no Compose UI/TalkBack pass is claimed.

## 7. iOS Result

SwiftUI / SwiftPM / native Apple SDK retained. ChatView now uses
ConversationHeaderView and preserves back, scoped search, details and inspector
intents. Fake connection-derived peer presence and duplicate header chrome were
removed. Message actions use native sheet presentation instead of a custom
scrim, 28-point corner and shadow overlay.

Unused call/sidebar constants were deleted. Foreground color comes from the kit;
legacy font roles use native Dynamic Type styles rather than fixed point sizes.
FlarePanel, other reusable modifiers, local action content and composer forms
remain and intentionally fail the new ownership checks.

Swift tests and iPhone 17 Pro simulator build pass. The rebuilt app was installed
and launched; the login screenshot was inspected. No existing account was logged
in or messaged during that simulator smoke test.

## 8. Duplicate Component Inventory

| App | Baseline implementation | Public replacement | Adapter | Gap / result | Delete local UI? | Priority |
| --- | --- | --- | --- | --- | --- | --- |
| Web | host chat geometry / ResizeObserver | FlareChatWorkspace | slots + SDK callbacks | replaced; measured in kit | yes, done | P1 |
| Web | forward modal/select | FormSheet + ForwardPicker | target IDs + confirm command | controlled/busy/embedded API added | yes, done | P1 |
| Web | payload/settings dialogs | FormSheet + FormField + Select | business field state | replaced | yes, done | P2 |
| Web | sync card / progress / tags | EmptyState + StatusBanner | sync progress/counters/retry | replaced; percentage retained as text | yes, done | P2 |
| Web | account/search legacy structures | public workspace/menu contracts | navigation/search state | still partial | yes | P2 |
| Tauri | simplified ReferenceApp + demo adapter | full shared reference composition | native client/path bridge | replaced; native E2E open | yes, done | P1 |
| Flutter | AppBar/presence pill | FlareConversationHeader | identity/presence/actions | replaced | yes, done | P1 |
| Flutter | reaction ActionChips | FlareReactionSummary | add/remove callback | replaced + kit accessibility fix | yes, done | P2 |
| Flutter | avatar palette | FlareAvatar | user ID/display name | replaced | yes, done | P2 |
| Flutter | composer/reply/media fragments | kit Composer/parts/preview | native capabilities/media | remains partial | yes | P1 |
| Android | custom header/search glyph | ConversationHeader | identity/capabilities | replaced | yes, done | P1 |
| Android | menus/search/forms | public action/form/workspaces | callbacks | remains partial | yes | P1 |
| iOS | custom chat header | ConversationHeaderView | identity/intents | replaced | yes, done | P1 |
| iOS | custom action backdrop | native sheet + kit action components | sheet binding | backdrop removed; content incomplete | yes | P1 |
| Native | fixed theme systems | kit theme + platform bridge | appearance/brand selection | reduced, not finished | yes | P1 |

Baseline dependencies: Web/Tauri retain Naive UI for existing provider, toast,
icon and debug integration; Flutter retains Material/Cupertino host support;
Android retains Material3; iOS retains SwiftUI. These are not permission to
implement a parallel IM design system.

## 9. Local Styles Removed

Measured changes for inspected files, not a fabricated whole-repository LOC win:

| File / surface | Before | Current |
| --- | ---: | ---: |
| shared chat.css | 73 lines | 2 lines, hidden browser file input only |
| shared HomeSyncScreen.vue | 219 lines | 74 lines |
| Flutter flare_im_design.dart | 246 lines | 28 lines |
| Flutter flare_theme_tokens.dart | 145 lines | 36 lines |
| Flutter app_theme.dart | 165 lines | 33 lines |

Removed host chat/modal geometry, obsolete responsive chat selectors, settings
styles and reduced-motion !important override. Shared relocation itself is not
counted as deletion. Existing unrelated deletions are not credited to this task.
Raw native widget LOC includes adapters and cannot be treated as visual LOC
without a deeper AST/manual classification.

## 10. Remaining Host-Specific UI

Allowed: root viewport and router hosts, SDK Lab/diagnostics, endpoints,
permissions, native file/camera/microphone pickers, tray/window lifecycle,
native sheet presentation and SDK media resolution.
Not allowed: the remaining local native composer/menu/message presentation.
The latter stays on the migration backlog, not on an allowlist.

## 11. Library Gaps Discovered

- Vue ChatWorkspace lacked the composition/measurement surface used by the
  real app; the app's own observer and CSS duplicated that responsibility.
- ForwardPicker lacked controlled selection and embedded/busy composition for
  an asynchronous host FormSheet.
- EmptyState needed an actions slot without swallowing nested keyboard input.
- Flutter ReactionSummary used non-keyboard GestureDetector controls with a
  26-point target and no selected state.
- Existing native contract coverage is broader than current SDK-to-UI mapping.
  Mapping generic placeholders is not a finished poll/task/event/rich renderer.
- General Menu/Drawer/etc. are still marked planned in parts of the library's
  maturity model. Product-specific public components exist, but that does not
  prove every native flow has a canonical replacement.

## 12. Library Changes Made

- ChatWorkspace: flow/overlay placement, header/notice/toolbar/timeline/composer/
  overlays regions, measured composer height, equality-guarded observer cleanup
  and timeline bottomInset slot data. Existing flow default preserved.
- ForwardPicker: v-model selected IDs, disabled search/selection/close while
  busy, embedded mode, accessible selection/focus and target pruning.
- EmptyState: reusable actions slot, nested keyboard/click behavior fixed.
- Flutter ReactionSummary: Material keyboard/focus interaction, merged selected
  semantics, disabled callback behavior, scoped add label and 48-point targets.
- Specs, generated catalogs/docs and focused regression tests updated.
  Generated artifacts were regenerated with project tooling, not hand-edited.

## 13. SDK Adapter Architecture

```text
SDK client factory (Web WASM / Tauri IPC / Dart FFI / Kotlin / Swift)
  -> session + repositories + event state
  -> presentation contracts + capabilities
  -> public design-kit components
  -> app routing and platform intents
```

Web/Tauri share full composition, not a reusable component implementation.
Factory registration occurs before mounting. Missing registration fails explicitly.
Native app adapters preserve existing SDK ownership. Contact/group adapters were
not invented for unsupported Core relationships. Call capability completeness,
all lifecycle vectors and native media actions still need cross-app validation.

## 14. Message Renderer Adoption

Web/Tauri runtime: shared workbench -> public MessageList -> canonical bubble,
content, meta/status and reaction components. No application message CSS patch.
Native runtime: app mapper -> public MessageBubble -> public content renderer.

Coverage is incomplete: Android collapses rich text/quote/forward/thread into
FlareTextContent; poll/task/schedule use GenericContent. Swift similarly has
generic fallback and reduced content mapping. Flutter's default GenericContent
path leaves richer contracts unmapped. These are P1 semantic gaps, not a pass.
Sticker/GIF/emoji external metadata rules are inherited only where canonical
content is actually used; all native formats were not visually verified.

## 15. Composer Adoption

All five delegate the main composer to the kit. Web/Tauri now share real SDK
send, rich text, voice and attachment handlers. Payload and forwarding flows
retain asynchronous busy handling and SDK commands.
Flutter/Android/iOS still have local accessory forms, rich-input and attachment
presentation. Platform recorder APIs may remain in hosts; recorder UI may not.

## 16. Navigation Adoption

Kit shells remain wired across all targets. SDK Lab stays a host item.
Web/Tauri preserve login guards, real sync and conversation routing; they no
longer show demo data through a separate simplified navigation implementation.
Native directory/media workspace parity and all keyboard/hover routes remain
incomplete. Utility pages must not reserve an empty conversation column.

## 17. Contacts / Groups / Search Adoption

Core scope does not include Social relationships or group administration; no
fake contacts/groups were added. A future real Social adapter must compose the
public directory workspaces. Group conversation membership remains messaging.
Web scoped message search/jump was exercised with the real service. Native
search exists but still contains local surfaces and lacks comparable UI E2E.

## 18. Theme Adoption

Source palette: Violet, Ocean, Forest, Sunset, Rose, Graphite x Light/Dark.
No new palette was introduced. Web/Tauri use public theme selection and tokens.
Flutter removed the redundant constants but legacy aliases are still fixed-light.
Android's legacy roles and iOS presentation modifiers remain. All-brand native
screen coverage was not demonstrated and must not be described as complete.

## 19. Responsive Behavior

Web checks cover desktop and H5 widths through 320/390/768/1024/1440/1920,
plus constrained keyboard height, long text, expanded composer and attachment
preview. Real-message list width equals its viewport; outgoing edge gap remains
7-24 CSS pixels without horizontal overflow. Stabilized layout samples verify
no composer/timeline oscillation and preserve history position.

Native package tests cover responsive primitives, not every application screen.
Flutter mobile/tablet/desktop, Android large screen and iOS Dynamic Type still
require device-level review after the remaining local surfaces are migrated.

## 20. Accessibility And Design Audit

The task remains a compact, content-first IM workbench. No new landing page,
marketing card grid or decorative layer was added. Native platform interaction
is retained rather than mimicking Web pixels.

Verified: Web visible controls at desktop/mobile, header truncation, keyboard
height; kit EmptyState nested key behavior; Flutter reaction disabled/keyboard/
selected semantics. iOS login launches without blank/overlapping content.
Not verified: full VoiceOver/TalkBack, all contrast/theme combinations, native
message/media workflows, real microphone permissions and reduced-motion cases.

Provisional source-and-evidence scores, 1-10; native scores are not screenshot
parity certification. N/A directory rows follow the Core scope described above.

| Dimension | Web | Tauri | Flutter | Android | iOS |
| --- | ---: | ---: | ---: | ---: | ---: |
| Design-kit adoption | 8 | 8 | 6 | 6 | 6 |
| Duplicate UI removal | 7 | 7 | 4 | 5 | 4 |
| Local style purity | 7 | 7 | 4 | 5 | 4 |
| Design consistency | 8 | 7 | 5 | 5 | 5 |
| Navigation | 8 | 7 | 6 | 6 | 6 |
| Conversation List | 8 | 7 | 6 | 6 | 6 |
| Conversation Header | 9 | 8 | 8 | 8 | 8 |
| Messages | 8 | 7 | 5 | 5 | 5 |
| Voice | 8 | 5 | 5 | 5 | 5 |
| Sticker / Emoji | 8 | 6 | 5 | 5 | 5 |
| Composer | 8 | 6 | 4 | 5 | 4 |
| Contacts | N/A | N/A | N/A | N/A | N/A |
| Groups directory | N/A | N/A | N/A | N/A | N/A |
| Search | 8 | 6 | 5 | 5 | 5 |
| Media | 6 | 5 | 4 | 4 | 4 |
| Theme | 7 | 7 | 4 | 5 | 5 |
| Responsive | 8 | 6 | 5 | 4 | 5 |
| Accessibility | 7 | 5 | 5 | 4 | 5 |
| SDK / UI separation | 7 | 7 | 6 | 6 | 6 |
| Code simplicity | 5 | 7 | 4 | 5 | 5 |
| Reference quality | 7 | 6 | 5 | 5 | 5 |

No new P0 was observed in the executed flows; unexecuted native flows may still
contain blockers. P1/P2 findings and acceptance work are listed in section 24.

## 21. Tests And Gates

| Validation | Result / scope |
| --- | --- |
| Web npm test (serial workers) | PASS: 41 tests / 10 files, SFC and SDK architecture checks |
| Web combined Playwright | PASS: 18 cases, including login/reference and real-service pixel-surface |
| Web real-service pixel-surface | PASS: two isolated accounts, login, send/receive/read, search, composer, responsive/stability |
| Tauri frontend tests | PASS: 5 tests; not native GUI E2E |
| Flutter app analyze / tests | PASS: no issues; 71 tests (environment-gated helper tests are not real-service evidence) |
| Flutter kit analyze / tests | PASS: no issues; 353 tests, including 2 new reaction tests |
| Android unit / lint | PASS |
| Android instrumentation compile | NO-SOURCE; no attached device; no UI execution |
| Swift package tests | PASS: 53 executed, 6 explicitly skipped, zero failures |
| Vue kit full tests | PASS: 325 tests / 54 files, including ChatWorkspace, ForwardPicker, EmptyState, FormSheet |
| Gate unit tests | PASS: 3 tests, including shared source, lazy imports and PascalCase components |
| Design system check | PASS: all 32 gates including website build |
| Reference public API | PASS: 248 source files, 0 findings |
| Reference duplicate UI | FAIL: 3 findings, no suppression |
| Reference style ownership | FAIL: 21 findings, no suppression |
| git diff --check | PASS across design, SDK and all five app repositories |

The new three checks are wired into `check-reference-example-ui.mjs` and
Makefile targets. The aggregate intentionally exits nonzero on remaining native
violations. Native checks are heuristic; lack of a hit does not prove purity.
The 3 remaining declaration findings are Android FlareType, Flutter
FlareThemeTokens and iOS FlarePanel. A token-only alias is transitional, not
proof that all callers have moved to context-aware public components.

Real Web test setup: a second local Vite instance used the existing API proxy
to the established development server. Initial direct requests hit a missing
API prefix and then CORS; no server settings or browser security were changed.
One subsequent test was interrupted by generated-file HMR. The settled rerun
passed without relaxing assertions. Test accounts use a timestamped pw-pixel
prefix; no existing conversations were used for send tests.

Final verification: the full Vue kit suite passed 325 tests. The final Web
combined suite passed all 18 cases after the sync/login feedback and timeline
pointer-dismiss changes. No test assertion was weakened to obtain these passes.
The temporary proxy on port 1431 is stopped after testing; the existing
development servers remain untouched.

## 22. Builds And Visual Evidence

- Web: vue-tsc + production Vite build PASS; all chunks within 800 KiB.
- Tauri: frontend build PASS (1400 KiB budget); cargo check PASS.
- Flutter: macOS debug application build PASS after theme/header changes.
- Android: assembleDebug PASS; compileDebugAndroidTestKotlin has no source.
- iOS: Swift package build PASS; Xcode iPhone 17 Pro simulator build PASS,
  CODE_SIGNING_ALLOWED=NO, derived data at `/tmp/flare-canonical-ios-derived`.
- iOS simulator install/launch smoke PASS; screenshot
  `/tmp/flare-canonical-ios-launch.png` inspected. Login only, no native IM E2E.
- Web screenshots at
  `flare-core-web-app/test-results/pixel-surface-real-SDK-con-4e998-poser-across-desktop-and-H5-chromium/`;
  desktop and H5 were visually inspected. Includes expanded/stability, rich
  text, attachment and keyboard-height captures.

Build success does not establish media playback, native permissions, TalkBack/
VoiceOver or UI equivalence. No new screenshots were captured for Android,
Flutter application screens or Tauri native GUI. Cross-app visual review is partial.

## 23. Remaining Platform Limitations

No Android device is attached. The iOS simulator is available and builds, but
the project has no completed UI automation for these flows. Native real-service
tests require their documented environments; six Swift tests were skipped.
Tauri installer signing and native GUI/permission automation were not run.
Flutter's call-kit stub must not be presented as real RTC support.
The Core/Social scope boundary and remote CORS policy are explicit, not hidden
by fake data. Neither explains away missing canonical native presentation.

## 24. Remaining P1/P2/P3 And Migration Plan

| Priority | Problem / evidence | User impact | Next implementation | Preserve / acceptance |
| --- | --- | --- | --- | --- |
| P1 | Native GenericContent/plain-text fallback in message adapters | Rich/forward/poll/task/event semantics lost | Map complete public content contracts; add missing canonical kit renderer first | SDK payloads/actions unchanged; per-kind fixture and real-message tests |
| P1 | Flutter composer_sheets/reply_strip; iOS ComposerControls/Forms; Android forms | Same feature has competing presentation/state handling | Move reusable interaction into public kit parts; keep platform recorder/file APIs | Send, reply/edit, attachment cancel/retry and permission failure E2E |
| P1 | Native fixed-light aliases and local panel/menu modifiers | Theme drift and inconsistent focus/touch behavior | Context-aware kit theme; canonical settings/menu/workspace composition | Six brands x two modes; dynamic type and keyboard tests |
| P1 | Native media workspace missing; Tauri native E2E absent | Build can pass while file/voice/search workflows fail | Integrate real capability/media adapters and canonical workspace/viewers | Native send/play/open/share/search smoke with isolated data |
| P1 | Call-kit stub appears enabled in Flutter configuration | Availability can overstate real capability | Resolve capability from actual bridge; hide/disable unsupported controls | No simulated connected/available state |
| P2 | Shared workbench/account/search structure remains large | Reuse and ownership harder to audit | Extract only real adapter responsibility; move reusable menu/search layout to kit | Preserve routes, query scope, history jump, settings |
| P2 | Static gates cannot detect all native decorated wrappers | False confidence despite local visuals | AST-aware checks plus device tests; retain current failures | No blanket allowlist/baseline erasing real findings |
| P2 | Native screenshot/assistive-technology coverage incomplete | Cross-platform consistency unproven | Add reproducible platform scenarios and screen-reader checks | Record actual device evidence, not compilation proxies |
| P3 | Platform density/polish after ownership gaps close | Minor consistency differences | Refine canonical kit variants only | No app-level visual overrides |

Order: complete native content/capability mapping -> migrate remaining composer/
menus/media/settings -> remove legacy aliases/modifiers -> expand native UI
automation -> repeat 21-dimension cross-app audit -> require all gates PASS.
No intermediate milestone in this report authorizes the COMPLETE marker.
