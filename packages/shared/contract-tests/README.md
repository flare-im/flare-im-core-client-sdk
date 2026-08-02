# Contract Tests

Contract tests validate that each platform package encodes requests, decodes responses and maps events according to `sdk-spec/manifest.json`.

Planned structure:

```text
golden/requests  -> platform encoder tests
golden/responses -> platform decoder tests
golden/events    -> platform event mapping tests
```
