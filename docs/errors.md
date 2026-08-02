# Errors

All platform SDKs expose the shared error shape:

```text
code
message
operation
retryable
details
cause
```

Stable error codes are generated from `sdk-spec/manifest.json`.

Do not collapse SDK failures into generic platform exceptions without preserving `code`.
