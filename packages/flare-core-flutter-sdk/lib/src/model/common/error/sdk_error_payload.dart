// GENERATED. Do not edit by hand.

/// Stable error payload used by lifecycle and async notification failures.
final class SdkErrorPayload {
  /// wire: `code`. Stable machine-readable error code.
  final String code;
  /// wire: `message`. Human-readable error message.
  final String message;
  /// wire: `operation`. Operation that failed.
  final String? operation;
  /// wire: `retryable`. Whether retrying may succeed.
  final bool? retryable;
  /// wire: `details`. Opaque diagnostic details.
  final Map<String, String> details;

  const SdkErrorPayload({
    this.code = '',
    this.message = '',
    this.operation,
    this.retryable,
    this.details = const {},
  });
}
