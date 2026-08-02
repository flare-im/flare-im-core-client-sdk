package com.flare.im.listener

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
/** Connection listener callbacks. */
interface ConnectionEventListener {
    /** SDK is connecting to the IM server. */
    fun onConnecting(event: ConnectionEvent) {}
    /** SDK connected to the IM server successfully. */
    fun onConnectSuccess(event: ConnectionEvent) {}
    /** SDK connection is authenticated and ready for message traffic. */
    fun onConnectReady(event: ConnectionEvent) {}
    /** SDK failed to connect to the IM server. */
    fun onConnectFailed(event: ConnectionEvent) {}
    /** SDK disconnected from the IM server. */
    fun onDisconnected(event: ConnectionEvent) {}
    /** SDK is attempting to reconnect to the IM server. */
    fun onReconnecting(event: ConnectionEvent) {}
    /** SDK reconnect attempt failed. */
    fun onReconnectFailed(event: ConnectionEvent) {}
    /** The account logged in elsewhere and this device was kicked offline. */
    fun onKickedOffline(event: ConnectionEvent) {}
    /** The login token expired and the app should renew credentials. */
    fun onUserTokenExpired(event: ConnectionEvent) {}
}
