import Foundation

/// GENERATED. Do not edit by hand.
/// Message listener callbacks.
public protocol MessageEventListener: AnyObject {
    /// A single message was received.
    func onMessageReceived(_ event: MessageReceivedEvent)
    /// A batch of messages was received.
    func onMessageReceivedBatch(_ event: MessageReceivedBatchEvent)
    /// A message send operation was acknowledged.
    func onMessageSendAck(_ event: MessageSendAckEvent)
    /// A message send operation failed.
    func onMessageSendFailed(_ event: MessageSendFailedEvent)
    /// A message was recalled.
    func onMessageRecalled(_ event: MessageMutationEvent)
    /// A message was edited.
    func onMessageEdited(_ event: MessageMutationEvent)
    /// A message was deleted.
    func onMessageDeleted(_ event: MessageMutationEvent)
    /// A message read receipt changed.
    func onMessageReadReceipt(_ event: ReadReceiptEvent)
    /// A message reaction changed.
    func onMessageReactionChanged(_ event: ReactionChangedEvent)
    /// A conversation input or typing status changed.
    func onInputStatusChanged(_ event: TypingEvent)
    /// Aggregated typing status changed for a large conversation.
    func onTypingAggregateChanged(_ event: TypingAggregateEvent)
    /// A burn-after-read message was burned.
    func onMessageBurned(_ event: MessageMutationEvent)
    /// A message was pinned.
    func onMessagePinned(_ event: MessageMutationEvent)
    /// A message was unpinned.
    func onMessageUnpinned(_ event: MessageMutationEvent)
}

public extension MessageEventListener {
    func onMessageReceived(_ event: MessageReceivedEvent) {}
    func onMessageReceivedBatch(_ event: MessageReceivedBatchEvent) {}
    func onMessageSendAck(_ event: MessageSendAckEvent) {}
    func onMessageSendFailed(_ event: MessageSendFailedEvent) {}
    func onMessageRecalled(_ event: MessageMutationEvent) {}
    func onMessageEdited(_ event: MessageMutationEvent) {}
    func onMessageDeleted(_ event: MessageMutationEvent) {}
    func onMessageReadReceipt(_ event: ReadReceiptEvent) {}
    func onMessageReactionChanged(_ event: ReactionChangedEvent) {}
    func onInputStatusChanged(_ event: TypingEvent) {}
    func onTypingAggregateChanged(_ event: TypingAggregateEvent) {}
    func onMessageBurned(_ event: MessageMutationEvent) {}
    func onMessagePinned(_ event: MessageMutationEvent) {}
    func onMessageUnpinned(_ event: MessageMutationEvent) {}
}
