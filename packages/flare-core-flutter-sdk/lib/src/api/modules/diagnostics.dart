// GENERATED. Do not edit by hand.
// Module API: `diagnostics` — SDK version and FFI contract diagnostics.
import '../../model/model.dart';

/// SDK version and FFI contract diagnostics.
abstract interface class DiagnosticsApi {
  /// getSdkVersion maps to `flare_sdk_version` via `ffi-symbol`. Operation: `diagnostics.sdk_version`.
  Future<Map<String, Object?>> getSdkVersion();
  /// getFfiContractVersion maps to `flare_sdk_ffi_contract_version` via `ffi-symbol`. Operation: `diagnostics.ffi_contract_version`.
  Future<Map<String, Object?>> getFfiContractVersion();
  /// getDataRoot maps to `flare_sdk_data_root` via `ffi-symbol`. Operation: `diagnostics.data_root`.
  Future<Map<String, Object?>> getDataRoot();
  /// getRuntimeHealth maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `diagnostics.runtime_health`.
  Future<RuntimeHealthResponse> getRuntimeHealth();
}
