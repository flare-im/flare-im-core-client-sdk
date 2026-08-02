package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
public interface CapabilityEventCallback {
    func handle(event: CapabilityEvent): Unit
}

public interface ConnectionEventCallback {
    func handle(event: ConnectionEvent): Unit
}

public interface ConversationEventCallback {
    func handle(event: ConversationEvent): Unit
}

public interface LifecycleEventCallback {
    func handle(event: LifecycleEvent): Unit
}

public interface MessageMutationEventCallback {
    func handle(event: MessageMutationEvent): Unit
}

public interface MessageReceivedBatchEventCallback {
    func handle(event: MessageReceivedBatchEvent): Unit
}

public interface MessageReceivedEventCallback {
    func handle(event: MessageReceivedEvent): Unit
}

public interface MessageSendAckEventCallback {
    func handle(event: MessageSendAckEvent): Unit
}

public interface MessageSendFailedEventCallback {
    func handle(event: MessageSendFailedEvent): Unit
}

public interface ProgressEventCallback {
    func handle(event: ProgressEvent): Unit
}

public interface ReactionChangedEventCallback {
    func handle(event: ReactionChangedEvent): Unit
}

public interface ReadReceiptEventCallback {
    func handle(event: ReadReceiptEvent): Unit
}

public interface SyncEventCallback {
    func handle(event: SyncEvent): Unit
}

public interface TypingAggregateEventCallback {
    func handle(event: TypingAggregateEvent): Unit
}

public interface TypingEventCallback {
    func handle(event: TypingEvent): Unit
}

public interface ViewUpdateCallback {
    func handle(event: ViewUpdate): Unit
}
