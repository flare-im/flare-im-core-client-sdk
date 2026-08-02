// GENERATED. Do not edit by hand.
import 'lifecycle_event_name.dart';
import '../../common/error/sdk_error_payload.dart';

/// Lifecycle notification. Method return values remain the primary success/failure contract.
final class LifecycleEvent {
  /// wire: `name`. Lifecycle event name.
  final LifecycleEventName name;
  /// wire: `operation`. Operation associated with this lifecycle event.
  final String operation;
  /// wire: `userId`. Current user id when known.
  final String? userId;
  /// wire: `sessionId`. SDK session id when available.
  final String? sessionId;
  /// wire: `error`. Failure details for *_failed events.
  final SdkErrorPayload? error;

  const LifecycleEvent({
    required this.name,
    this.operation = '',
    this.userId,
    this.sessionId,
    this.error,
  });
}
