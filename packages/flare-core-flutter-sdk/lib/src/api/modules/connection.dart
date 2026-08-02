// GENERATED. Do not edit by hand.
// Module API: `connection` — Connection state and manual network lifecycle.
import '../connection_state.dart';
import '../../model/model.dart';

/// Connection state and manual network lifecycle.
abstract interface class ConnectionApi {
  /// getConnectionState maps to `flare_sdk_state` via `ffi-symbol`. Operation: `connection.get_state`.
  Future<ConnectionState> getConnectionState();
  /// disconnect maps to `flare_sdk_disconnect` via `ffi-symbol`. Operation: `connection.disconnect`.
  Future<void> disconnect();
  /// notifyNetworkChange maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `connection.notify_network_change`.
  Future<NetworkChangeResponse> notifyNetworkChange(NetworkChangeRequest request);
}
