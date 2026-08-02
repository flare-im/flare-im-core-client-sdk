// GENERATED. Do not edit by hand.
import 'capability_event_name.dart';

/// Capability/plugin notification payload.
final class CapabilityEvent {
  /// wire: `name`. Capability event name.
  final CapabilityEventName name;
  /// wire: `capability`. Capability key.
  final String? capability;
  /// wire: `reason`. Unavailable/change reason.
  final String? reason;

  const CapabilityEvent({
    required this.name,
    this.capability,
    this.reason,
  });
}
