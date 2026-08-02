package com.flare.im.adapter.module

import com.flare.im.adapter.codec.*
import com.flare.im.api.ConnectionState
import com.flare.im.api.capabilities.CapabilitiesApi
import com.flare.im.callback.*
import com.flare.im.contract.NativeBridge
import com.flare.im.contract.NativeCallMap
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
class DefaultCapabilitiesApi(
    private val bridge: NativeBridge,
) : CapabilitiesApi {

    override suspend fun listCapabilities(request: Map<String, Any?>): Map<String, Any?> {
        return invokeMap(bridge, NativeCallMap.CAPABILITY_LIST, request)
    }

    override suspend fun listUserCapabilities(request: Map<String, Any?>): Map<String, Any?> {
        return invokeMap(bridge, NativeCallMap.CAPABILITY_LIST_USER, request)
    }

    override suspend fun dispatchCapability(request: Map<String, Any?>): Map<String, Any?> {
        return invokeMap(bridge, NativeCallMap.CAPABILITY_DISPATCH, request)
    }

    override suspend fun grantCapability(request: Map<String, Any?>): Unit {
        invokeUnit(bridge, NativeCallMap.CAPABILITY_GRANT, request)
    }

    override suspend fun revokeCapability(request: Map<String, Any?>): Unit {
        invokeUnit(bridge, NativeCallMap.CAPABILITY_REVOKE, request)
    }

    override suspend fun sendCallSignal(request: Map<String, Any?>): Unit {
        invokeUnit(bridge, NativeCallMap.CAPABILITY_SEND_CALL_SIGNAL, request)
    }
}
