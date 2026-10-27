# Mobile credential storage

`MobileCredentialStore` is a thin Flutter runtime adapter for iOS Keychain and Android Keystore-backed authenticated encryption. It does not own authentication or renewal policy. The host supplies a stable tenant/installation binding and a distinct legacy preference key.

Reads migrate a legacy plaintext value into the OS vault before returning it, then remove the old preference. A versioned encrypted wrapper binds it to the installation and tenant. Interrupted saves, failed migration, failed reads and deletion leave a non-secret blocked marker, so an older one-time token cannot be replayed. Writes, reads and clears share a per-key queue across clients in the isolate. An encrypted random revision must match its non-secret preference checkpoint. This rejects an old ciphertext after Android loses an asynchronous apply() write; OS vault loss never reactivates an obsolete plaintext record. Explicit successful authentication may replace a blocked record; a read cannot unblock one. There is no plaintext fallback or automatic key reset.

The host must validate the stored session schema and endpoint identity before authentication, serialize snapshot reads with writes, and stop stale generations after logout/kick. Android hosts must disable backup or exclude both encrypted preferences and wrapping-key files; this example disables app backup. iOS hosts must enable the app-specific Keychain access group and sign simulator builds through Xcode as well as device builds. iOS uses AfterFirstUnlockThisDeviceOnly with synchronization disabled.

Unit tests can inject `CredentialStore` or replace only the platform channel. Real simulator acceptance must use the registered native plugin and restart the app process.

Android deliberately retains the existing `sharedPreferencesName` option and encrypted vault identity. The pinned plugin reports a deprecation info suggesting `storageNamespace`; changing it also changes key isolation and requires an explicit, versioned encrypted-vault migration. Do not replace the option silently or enable key reset to silence that diagnostic. Analysis may retain this known info; all errors and warnings remain fatal.

安全存储迁移、损坏记录、删除失败和队列回归由本包 `test/secure_session_store_test.dart` 维护，在本包运行 `flutter test`。示例应用只测试其认证流程组合。
