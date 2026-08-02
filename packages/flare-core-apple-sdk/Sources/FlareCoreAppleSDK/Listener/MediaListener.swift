import Foundation

/// GENERATED. Do not edit by hand.
/// Media listener callbacks.
public protocol MediaEventListener: AnyObject {
    /// Media upload progress changed.
    func onUploadProgress(_ event: ProgressEvent)
    /// Media download progress changed.
    func onDownloadProgress(_ event: ProgressEvent)
}

public extension MediaEventListener {
    func onUploadProgress(_ event: ProgressEvent) {}
    func onDownloadProgress(_ event: ProgressEvent) {}
}
