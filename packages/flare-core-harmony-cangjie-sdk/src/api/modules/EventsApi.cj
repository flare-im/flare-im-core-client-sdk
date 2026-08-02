package flare_core_harmony_cangjie_sdk.api.modules

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Typed SDK event stream.
public interface EventsApi {
    func subscribeEvents(requestJson: String): String
    func subscribeEventsBatch(requestJson: String): String
    func unsubscribe(requestJson: String): Unit
    func unsubscribeAll(): Unit
}
