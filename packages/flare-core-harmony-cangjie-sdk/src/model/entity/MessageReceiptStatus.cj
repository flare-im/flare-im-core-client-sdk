package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Receipt state the core SDK projects for a message: pending (built locally, not yet sending), sending (no server sequence yet, media uploading included), sent (the server has it), read (single chat: the peer read it; group: the read summary says all members read it), failed (retryable). There is no delivered state.
public enum MessageReceiptStatus {
    | Pending
    | Sending
    | Sent
    | Read
    | Failed
}
