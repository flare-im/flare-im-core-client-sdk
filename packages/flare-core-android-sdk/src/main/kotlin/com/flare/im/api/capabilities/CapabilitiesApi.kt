package com.flare.im.api.capabilities

import com.flare.im.api.ConnectionState
import com.flare.im.callback.*
import com.flare.im.listener.*
import com.flare.im.model.catalog.*
import com.flare.im.model.command.*
import com.flare.im.model.command.message.*
import com.flare.im.model.command.message.build.*
import com.flare.im.model.common.enums.*
import com.flare.im.model.common.error.*
import com.flare.im.model.content.*
import com.flare.im.model.entity.*
import com.flare.im.model.event.*
import com.flare.im.model.event.capability.*
import com.flare.im.model.event.connection.*
import com.flare.im.model.event.conversation.*
import com.flare.im.model.event.lifecycle.*
import com.flare.im.model.event.message.*
import com.flare.im.model.event.presence.*
import com.flare.im.model.event.progress.*
import com.flare.im.model.event.sync.*
import com.flare.im.model.media.*
import com.flare.im.model.query.*
import com.flare.im.model.response.*

/** GENERATED. Do not edit by hand. */
/** Capability discovery and optional plugin dispatch through capability dispatch ops. */
interface CapabilitiesApi {
    /** listCapabilities maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_list`. Operation: `capability.list`. */
    suspend fun listCapabilities(request: Map<String, Any?>): Map<String, Any?>
    /** listUserCapabilities maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_list_user`. Operation: `capability.list_user`. */
    suspend fun listUserCapabilities(request: Map<String, Any?>): Map<String, Any?>
    /** dispatchCapability maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_dispatch`. Operation: `capability.dispatch`. */
    suspend fun dispatchCapability(request: Map<String, Any?>): Map<String, Any?>
    /** grantCapability maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_grant`. Operation: `capability.grant`. */
    suspend fun grantCapability(request: Map<String, Any?>): Unit
    /** revokeCapability maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `capability_revoke`. Operation: `capability.revoke`. */
    suspend fun revokeCapability(request: Map<String, Any?>): Unit
    /** sendCallSignal maps to `flare_capability_dispatch_json` via `capability-dispatch-json`, dispatch op `send_call_signal`. Operation: `capability.send_call_signal`. */
    suspend fun sendCallSignal(request: Map<String, Any?>): Unit
}
