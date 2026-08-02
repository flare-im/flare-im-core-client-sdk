// GENERATED. Do not edit by hand.
import { ConnectionEvent } from '../model';

/** Connection listener callbacks. */
export interface ConnectionEventListener {
  /** SDK is connecting to the IM server. */
  onConnecting?(event: ConnectionEvent): void;
  /** SDK connected to the IM server successfully. */
  onConnectSuccess?(event: ConnectionEvent): void;
  /** SDK connection is authenticated and ready for message traffic. */
  onConnectReady?(event: ConnectionEvent): void;
  /** SDK failed to connect to the IM server. */
  onConnectFailed?(event: ConnectionEvent): void;
  /** SDK disconnected from the IM server. */
  onDisconnected?(event: ConnectionEvent): void;
  /** SDK is attempting to reconnect to the IM server. */
  onReconnecting?(event: ConnectionEvent): void;
  /** SDK reconnect attempt failed. */
  onReconnectFailed?(event: ConnectionEvent): void;
  /** The account logged in elsewhere and this device was kicked offline. */
  onKickedOffline?(event: ConnectionEvent): void;
  /** The login token expired and the app should renew credentials. */
  onUserTokenExpired?(event: ConnectionEvent): void;
}
