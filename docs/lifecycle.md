# Lifecycle

Canonical lifecycle:

```text
create(config)
login(request)
use module APIs
logout()
dispose()
```

`dispose` releases the native handle. Event subscriptions and long-running media tasks must be cancelled before disposal where the platform requires explicit cleanup.
