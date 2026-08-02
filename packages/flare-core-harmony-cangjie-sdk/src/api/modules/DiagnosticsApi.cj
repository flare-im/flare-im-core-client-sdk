package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// SDK version and FFI contract diagnostics.
public interface DiagnosticsApi {
    func getSdkVersion(): String
    func getFfiContractVersion(): String
    func getDataRoot(): String
    func getRuntimeHealth(): RuntimeHealthResponse
}
