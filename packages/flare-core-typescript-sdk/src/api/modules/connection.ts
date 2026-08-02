/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `connection` — Connection state and manual network lifecycle.
 */
import type { ConnectionState } from '../../contract';
import type { NetworkChangeRequest, NetworkChangeResponse } from '../../model';

/** Connection state and manual network lifecycle. */
export interface ConnectionApi {
  /** getConnectionState maps to `flare_sdk_state` via `ffi-symbol`. Operation: `connection.get_state`. */
  getConnectionState(): Promise<ConnectionState>;
  /** disconnect maps to `flare_sdk_disconnect` via `ffi-symbol`. Operation: `connection.disconnect`. */
  disconnect(): Promise<void>;
  /** notifyNetworkChange maps to `flare_sdk_invoke_json`. Operation: `connection.notify_network_change`. */
  notifyNetworkChange(request: NetworkChangeRequest): Promise<NetworkChangeResponse>;
}
