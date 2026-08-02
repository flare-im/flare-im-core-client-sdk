package flare_core_harmony_cangjie_sdk.listener

import flare_core_harmony_cangjie_sdk.model.*

// GENERATED. Do not edit by hand.
// Connection listener callbacks.
public interface ConnectionEventListener {
    // SDK is connecting to the IM server.
    func onConnecting(event: ConnectionEvent): Unit
    // SDK connected to the IM server successfully.
    func onConnectSuccess(event: ConnectionEvent): Unit
    // SDK connection is authenticated and ready for message traffic.
    func onConnectReady(event: ConnectionEvent): Unit
    // SDK failed to connect to the IM server.
    func onConnectFailed(event: ConnectionEvent): Unit
    // SDK disconnected from the IM server.
    func onDisconnected(event: ConnectionEvent): Unit
    // SDK is attempting to reconnect to the IM server.
    func onReconnecting(event: ConnectionEvent): Unit
    // SDK reconnect attempt failed.
    func onReconnectFailed(event: ConnectionEvent): Unit
    // The account logged in elsewhere and this device was kicked offline.
    func onKickedOffline(event: ConnectionEvent): Unit
    // The login token expired and the app should renew credentials.
    func onUserTokenExpired(event: ConnectionEvent): Unit
}
