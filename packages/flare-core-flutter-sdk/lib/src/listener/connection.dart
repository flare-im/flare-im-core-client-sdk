// GENERATED. Do not edit by hand.
import '../model/model.dart';

/// Connection listener callbacks.
abstract class ConnectionEventListener {
  const ConnectionEventListener();
  /// SDK is connecting to the IM server.
  void onConnecting(ConnectionEvent event) {}
  /// SDK connected to the IM server successfully.
  void onConnectSuccess(ConnectionEvent event) {}
  /// SDK connection is authenticated and ready for message traffic.
  void onConnectReady(ConnectionEvent event) {}
  /// SDK failed to connect to the IM server.
  void onConnectFailed(ConnectionEvent event) {}
  /// SDK disconnected from the IM server.
  void onDisconnected(ConnectionEvent event) {}
  /// SDK is attempting to reconnect to the IM server.
  void onReconnecting(ConnectionEvent event) {}
  /// SDK reconnect attempt failed.
  void onReconnectFailed(ConnectionEvent event) {}
  /// The account logged in elsewhere and this device was kicked offline.
  void onKickedOffline(ConnectionEvent event) {}
  /// The login token expired and the app should renew credentials.
  void onUserTokenExpired(ConnectionEvent event) {}
}
