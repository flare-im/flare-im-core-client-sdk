# Core IM Group Load Test Report - 2026-06-29

## Scope

- Scenario: 10 users in one group, each user sends 1000 messages.
- Total send commands: 10000.
- Expected remote group deliveries: 90000.
- Send window: 32 in-flight, 32 ACK in-flight.
- Receive wait window: 600s.
- Apps/contracts covered by prior module validation in this run set: core SDK example, push-server, push-worker, gateway path, Vue IM UI virtualization package checks, web/tauri/flutter/iOS module checks from the same test cycle.
- Mentions/@ are intentionally not included here per earlier instruction to defer @ handling.

## Fixes Applied

- Fixed sync-orchestrator gRPC channel churn by caching tonic channels.
- Added group load test example with batch subscription and 10x1000 controls.
- Virtualized Vue message list for large histories.
- Fixed Tauri generated serde_json type path.
- Optimized message-ingest group recipient materialization.
- Removed storage-writer success ledger DB writes from hot path.
- Fixed gateway auth failure cleanup for invalid-token connections.
- Parallelized gateway connection fanout and push-server task publishing.
- Batched SDK persist worker jobs.
- Parallelized ordered MQ batch processing across different keys.
- Added push-worker message group fanout concurrency.
- Added short TTL device-route cache in push-worker.
- Changed push-server online fanout to publish one bulk online task per message/recipient set instead of per-user online tasks.
- Added SDK large-batch FTS hot-path downgrade: batches over 32 messages skip synchronous FTS writes.

## Results

| Run | Key change | Sent/ACK | Send errors | Remote received | Send throughput | ACK p95 | Remote throughput |
| --- | --- | ---: | ---: | ---: | ---: | ---: | ---: |
| 310-319 | pre bulk/cache baseline | 10000/10000 | 0 | 17371/90000 | 28.13 msg/s | 5372.98 ms | 28.95 msg/s |
| 320-329 | ordered-key + worker group concurrency | 10000/10000 | 0 | 17538/90000 | 30.84 msg/s | 5304.19 ms | 29.23 msg/s |
| 330-339 | + device route cache | 10000/10000 | 0 | 17190/90000 | 38.77 msg/s | 4305.52 ms | 28.65 msg/s |
| 340-349 | + bulk online task | 10000/10000 | 0 | 17269/90000 | 30.28 msg/s | 5140.59 ms | 28.78 msg/s |
| 350-359 | + large-batch FTS downgrade | 10000/10000 | 0 | 8348/90000 | 578.74 msg/s | 235.33 ms | 13.91 msg/s |
| 360-369 | attempted batch-only event dispatch | 10000/10000 | 0 | 0/90000 | 629.27 msg/s | 217.84 ms | 0 msg/s |

The batch-only event dispatch attempt caused a receive regression and was reverted. The validated remaining client change is the FTS downgrade.

## Memory

- Core services after load stayed in the tens-of-MB RSS range. Latest sample: push-server ~40 MB, push-worker ~18 MB, gateway ~22 MB, sync-orchestrator ~16 MB.
- The earlier 6 GB Activity Monitor view is not reproduced in the core services after the channel-cache fix.
- The active hot process during load was the single-process SDK load tool, not the core services. Before SDK FTS downgrade it reached about 568% CPU / 131 MB RSS; after downgrade, send-side CPU/RSS improved materially.

## Current Verdict

- Send path is now stable and fast at 10 users x 1000 messages with 32 in-flight: 10000/10000 ACK, 0 send errors.
- ACK latency improved dramatically after SDK large-batch FTS downgrade: p95 from multi-second range to ~235 ms in the best validated run.
- Remote group fanout is not yet Feishu/Telegram-level in this single-process 10-client load harness. The harness receives too few of the expected 90000 remote deliveries within 600s.
- The bottleneck has moved away from core service memory and basic send reliability. It is now in large downlink consumption/UI-local state flow: SDK convergence, local SQLite work, and the single-process test model.

## Remaining P0/P1 Work

- Add a crash-recoverable persistent FTS backfill queue if post-commit in-process backfill is not enough for release guarantees.
- Profile and optimize `IncomingMessageConverger` and SQLite read paths during large downlink.
- Add a load mode that runs 10 client processes instead of 10 SDK clients in one process, to separate real per-device performance from synthetic single-process contention.
- Add UI-level Playwright/Computer-use smoothness measurements after the SDK downlink bottleneck is reduced: frame drops, scroll FPS, initial render time, memory growth.
- Preserve `ReceivedBatch` while keeping single-message `Received` compatibility until all example apps are verified to consume batch events safely.

## 2026-06-29 Follow-up Remediation

Implemented after this report was summarized into the planning track:

- `NotificationInboundPipeline::finish_batch` now publishes `ReceivedBatch` first and yields every 128 single-message compatibility `Received` publishes. This keeps existing SDK/example callbacks compatible while reducing long monopolization of the async runtime during high-volume downlink.
- Large SQLite `save_batch` still skips inline FTS work in the hot transaction, but now schedules a post-commit background FTS backfill. This preserves the ACK/ingest latency improvement without leaving message search permanently incomplete.

Focused verification:

| Check | Result |
| --- | --- |
| `finish_batch_publishes_batch_and_preserves_single_message_callbacks` | Passed |
| `finish_batch_yields_between_large_single_message_compatibility_chunks` | Passed |
| `large_save_batch_backfills_fts_after_hot_path_commit` | Passed |
| `fts_search_tracks_save_update_and_delete` | Passed |
| `message_repo::tests` | Passed: 24 tests |
| `group_latency_throughput` example compile check | Passed |

Remaining after follow-up:

- Re-run the full 10 users x 1000 messages load test to quantify remote delivery improvement after SDK fairness/backfill changes.
- Add a persistent FTS backfill queue if process-crash recovery between commit and background task completion becomes a release requirement.
- Continue profiling SDK convergence and SQLite read paths; the previous report still shows remote deliveries far below the expected 90000.

## 2026-06-29 Follow-up Remediation 2

User direction changed after the earlier load report: this is still pre-production, so legacy compatibility may be broken to reach top-tier IM behavior.

Additional changes implemented:

- `NotificationInboundPipeline::finish_batch` now treats batch delivery as canonical and no longer replays every message as single `Received` callbacks. `finish_one` remains the single-message path.
- Core text message building now supports typed structured mentions through `mentionUsers`, `mentionAll`, and `content.data.mentions`.
- Direct invoke/shared dispatch, TypeScript SDK wire codec, and WASM smoke runtime now carry those typed mention fields.
- Vue composer now has an @ picker; Web, Tauri, and shared workspace derive candidates from conversation participants/member previews/`users:` channel IDs.

Focused verification:

| Check | Result |
| --- | --- |
| `finish_batch_publishes_batch_without_single_message_replay` | Passed |
| `build_text_materializes_structured_user_mentions` | Passed |
| `group_latency_throughput` example compile check | Passed |
| TypeScript SDK `wire_codec_contract.test.ts` | Passed: 22 tests |
| Vue IM UI typecheck | Passed |
| Web example typecheck | Passed |
| Tauri example typecheck | Passed |
| Vue IM UI smoke | Passed: 101 tests |

Remaining after this follow-up:

- Re-run the full 10 users x 1000 messages load test with the batch-canonical inbound path to measure remote delivery completeness and UI smoothness.
- Complete mention display polish and @me filter UX validation in running apps.
- Continue SDK convergence/SQLite read-path profiling; previous remote delivery numbers remain below the 90000 target until re-tested.
