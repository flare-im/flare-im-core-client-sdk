// GENERATED. Do not edit by hand.
import 'connection_event_name.dart';
import '../../common/enums/sdk_connection_state.dart';
import '../../common/error/sdk_error_payload.dart';

/// Connection notification payload.
final class ConnectionEvent {
  /// wire: `name`. Connection event name.
  final ConnectionEventName name;
  /// wire: `state`. Connection state after this event.
  final SdkConnectionState state;
  /// wire: `reason`. Disconnect, kicked-off, or token-expired reason.
  final String? reason;
  /// wire: `attempt`. Reconnect attempt number.
  final int? attempt;
  /// wire: `error`. Server or reconnect failure details.
  final SdkErrorPayload? error;

  const ConnectionEvent({
    required this.name,
    required this.state,
    this.reason,
    this.attempt,
    this.error,
  });
}
