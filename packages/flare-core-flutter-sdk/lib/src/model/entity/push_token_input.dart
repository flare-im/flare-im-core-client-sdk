// GENERATED. Do not edit by hand.

/// PushTokenInput
final class PushTokenInput {
  /// wire: `platform`. Native platform: android, ios or harmony.
  final String platform;
  /// wire: `provider`. OS delivery provider: fcm, apns or getui.
  final String provider;
  /// wire: `token`. OS-issued token. Never log or persist outside protected native storage.
  final String token;

  const PushTokenInput({
    this.platform = '',
    this.provider = '',
    this.token = '',
  });
}
