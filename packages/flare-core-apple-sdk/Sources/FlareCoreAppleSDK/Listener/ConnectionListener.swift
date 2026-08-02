import Foundation

/// GENERATED. Do not edit by hand.
/// Connection listener callbacks.
public protocol ConnectionEventListener: AnyObject {
    /// SDK is connecting to the IM server.
    func onConnecting(_ event: ConnectionEvent)
    /// SDK connected to the IM server successfully.
    func onConnectSuccess(_ event: ConnectionEvent)
    /// SDK connection is authenticated and ready for message traffic.
    func onConnectReady(_ event: ConnectionEvent)
    /// SDK failed to connect to the IM server.
    func onConnectFailed(_ event: ConnectionEvent)
    /// SDK disconnected from the IM server.
    func onDisconnected(_ event: ConnectionEvent)
    /// SDK is attempting to reconnect to the IM server.
    func onReconnecting(_ event: ConnectionEvent)
    /// SDK reconnect attempt failed.
    func onReconnectFailed(_ event: ConnectionEvent)
    /// The account logged in elsewhere and this device was kicked offline.
    func onKickedOffline(_ event: ConnectionEvent)
    /// The login token expired and the app should renew credentials.
    func onUserTokenExpired(_ event: ConnectionEvent)
}

public extension ConnectionEventListener {
    func onConnecting(_ event: ConnectionEvent) {}
    func onConnectSuccess(_ event: ConnectionEvent) {}
    func onConnectReady(_ event: ConnectionEvent) {}
    func onConnectFailed(_ event: ConnectionEvent) {}
    func onDisconnected(_ event: ConnectionEvent) {}
    func onReconnecting(_ event: ConnectionEvent) {}
    func onReconnectFailed(_ event: ConnectionEvent) {}
    func onKickedOffline(_ event: ConnectionEvent) {}
    func onUserTokenExpired(_ event: ConnectionEvent) {}
}
