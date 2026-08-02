package com.flare.im.api.connection

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
/** Connection state and manual network lifecycle. */
interface ConnectionApi {
    /** getConnectionState maps to `flare_sdk_state` via `ffi-symbol`. Operation: `connection.get_state`. */
    suspend fun getConnectionState(): ConnectionState
    /** disconnect maps to `flare_sdk_disconnect` via `ffi-symbol`. Operation: `connection.disconnect`. */
    suspend fun disconnect(): Unit
    /** notifyNetworkChange maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `connection.notify_network_change`. */
    suspend fun notifyNetworkChange(request: NetworkChangeRequest): NetworkChangeResponse
}
