# Client Observability

Flare IM client observability has one authority: core records runtime metrics
and exposes diagnostics through the generated SDK contract. Platform examples
should display or export these values; they should not invent parallel counters.

## Runtime Health

Every generated client exposes:

```ts
await client.diagnostics.getRuntimeHealth()
```

The response includes:

- `metricsEnabled`: whether this SDK session is collecting metrics.
- `state` / `stateCode`: the current connection state for diagnostics panels.
- `sessionGeneration`: the active session generation.
- `rawSubscriberDroppedTotal`: event drops caused by bounded subscriber queues.
- `metricsJson`: serialized counters, gauges, and histograms.

The drop counter is mirrored as `event.raw_subscriber_dropped_total` in the
metrics snapshot, which lets dashboards correlate UI symptoms with event-bus
backpressure.

## Metrics SPI

Host applications can inject a `MetricsSink` when building `IMClient`. Core
keeps an in-memory diagnostics snapshot and forwards the same samples to the
host sink when metrics are enabled.

Tracked metric families include:

- Event bus backpressure and subscriber drops.
- Reliable send queue depth, send retries, send failures, and ack progress.
- Sync batch throughput and durations.
- Dispatcher receive/send outcomes.

These cover the user-visible send→ack, send→render, reconnect, and sync→render
paths without requiring Web, Flutter, iOS, or Android to keep separate metric
logic.

## Verification

Run the lightweight gate:

```bash
cargo xtask observability
```

The gate is also part of `cargo xtask verify`. It checks the metrics SPI,
runtime health API, diagnostics SDK contract, and the runtime backpressure
regression test.
