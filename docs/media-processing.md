# Media Processing

Media processing is a core-orchestrated capability with platform/server
implementations at the edge. Clients provide files, bytes, or platform asset
locators; core decides when a `MediaProcessorPort` must inspect or prepare the
upload before `MediaUploaderPort` stores it.

## SDK Processing Chain

The stable media port is:

- `MediaProcessorPort::inspect`
- `MediaProcessorPort::prepare_upload`
- `MediaUploaderPort::upload`
- `MediaServicePort::upload`

`UploadOnlyMediaService::with_processor` wires the chain as:

```text
source -> MediaProcessorPort.prepare_upload -> MediaUploaderPort.upload
```

This is the required shape for client SDKs. Platform adapters may use native
image/video APIs, browser APIs, or a server processor, but app code should not
fork upload behavior per platform.

## Server Processor

`flare-media` owns the server-side processing commands for media jobs:

- Image compress.
- Image thumbnail.
- Video transcode.
- Video thumbnail extraction.
- Video compress.

Message content contracts carry image/video thumbnail fields and
`MediaSourceInfo.blurhash` as a typed derivative field. Clients must not smuggle
blurhash through unrelated metadata.

## Runtime Boundary

`RuntimeComponents::with_media_processor` injects a processor into the SDK
runtime. If a product needs stricter processing policy, it should configure the
runtime processor or call the media service job API, not implement custom
client-side message mutation.

## Verification

Run:

```bash
cargo xtask media-processing
```

The gate is also part of `cargo xtask verify`. It checks the SDK port, upload
chain, runtime wiring, server media command handlers, thumbnail-bearing message
contracts, and the typed blurhash field.
