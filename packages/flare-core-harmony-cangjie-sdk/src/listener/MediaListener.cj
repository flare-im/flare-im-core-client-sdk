package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Media listener callbacks.
public interface MediaEventListener {
    // Media upload progress changed.
    func onUploadProgress(event: ProgressEvent): Unit
    // Media download progress changed.
    func onDownloadProgress(event: ProgressEvent): Unit
}
