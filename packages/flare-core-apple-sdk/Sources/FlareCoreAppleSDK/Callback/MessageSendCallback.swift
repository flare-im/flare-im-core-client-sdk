import Foundation

/// GENERATED. Do not edit by hand.
/// Direct callback for `messages.sendMessage(request, callback)` progress and terminal states.
public protocol MessageSendCallback: AnyObject {
    /// Message upload or send progress changed.
    func onProgress(_ event: ProgressEvent)
    /// Message send completed successfully.
    func onSuccess(_ event: MessageSendAckEvent)
    /// Message send failed.
    func onFailure(_ event: MessageSendFailedEvent)
}

public extension MessageSendCallback {
    func onProgress(_ event: ProgressEvent) {}
    func onSuccess(_ event: MessageSendAckEvent) {}
    func onFailure(_ event: MessageSendFailedEvent) {}
}
