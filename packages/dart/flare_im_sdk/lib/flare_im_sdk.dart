/// Flutter dart:ffi binding to the Flare social + IM Rust core.
///
/// Exposes [SdkWrapper] — the async facade the example apps expect
/// (`init` / `loginWithPassword` / `registerWithPassword` / `logout` /
/// `socialDispatchJson`) — over the `flare-sdk-ffi` C ABI.
library flare_im_sdk;

export 'src/sdk_wrapper.dart' show SdkWrapper, SdkConfig, FlareSdkException;
