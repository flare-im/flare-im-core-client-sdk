/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `diagnostics` — SDK version and FFI contract diagnostics.
 */
import type { RuntimeHealthResponse } from '../../model';
import type { DataRootResponse, FfiContractVersion, SdkVersion } from '../types';

/** SDK version and FFI contract diagnostics. */
export interface DiagnosticsApi {
  /** getSdkVersion maps to `flare_sdk_version` via `ffi-symbol`. Operation: `diagnostics.sdk_version`. */
  getSdkVersion(): Promise<SdkVersion>;
  /** getFfiContractVersion maps to `flare_sdk_ffi_contract_version` via `ffi-symbol`. Operation: `diagnostics.ffi_contract_version`. */
  getFfiContractVersion(): Promise<FfiContractVersion>;
  /** getDataRoot maps to `flare_sdk_data_root` via `ffi-symbol`. Operation: `diagnostics.data_root`. */
  getDataRoot(): Promise<DataRootResponse>;
  /** getRuntimeHealth maps to `flare_sdk_invoke_json`. Operation: `diagnostics.runtime_health`. */
  getRuntimeHealth(): Promise<RuntimeHealthResponse>;
}
