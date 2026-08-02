package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Message listener callbacks.
public interface MessageEventListener {
    // A single message was received.
    func onMessageReceived(event: MessageReceivedEvent): Unit
    // A batch of messages was received.
    func onMessageReceivedBatch(event: MessageReceivedBatchEvent): Unit
    // A message send operation was acknowledged.
    func onMessageSendAck(event: MessageSendAckEvent): Unit
    // A message send operation failed.
    func onMessageSendFailed(event: MessageSendFailedEvent): Unit
    // A message was recalled.
    func onMessageRecalled(event: MessageMutationEvent): Unit
    // A message was edited.
    func onMessageEdited(event: MessageMutationEvent): Unit
    // A message was deleted.
    func onMessageDeleted(event: MessageMutationEvent): Unit
    // A message read receipt changed.
    func onMessageReadReceipt(event: ReadReceiptEvent): Unit
    // A message reaction changed.
    func onMessageReactionChanged(event: ReactionChangedEvent): Unit
    // A conversation input or typing status changed.
    func onInputStatusChanged(event: TypingEvent): Unit
    // Aggregated typing status changed for a large conversation.
    func onTypingAggregateChanged(event: TypingAggregateEvent): Unit
    // A burn-after-read message was burned.
    func onMessageBurned(event: MessageMutationEvent): Unit
    // A message was pinned.
    func onMessagePinned(event: MessageMutationEvent): Unit
    // A message was unpinned.
    func onMessageUnpinned(event: MessageMutationEvent): Unit
}

// Direct callback for `messages.sendMessage(request, callback)` progress and terminal states.
public interface MessageSendCallback {
    // Message upload or send progress changed.
    func onProgress(event: ProgressEvent): Unit
    // Message send completed successfully.
    func onSuccess(event: MessageSendAckEvent): Unit
    // Message send failed.
    func onFailure(event: MessageSendFailedEvent): Unit
}
