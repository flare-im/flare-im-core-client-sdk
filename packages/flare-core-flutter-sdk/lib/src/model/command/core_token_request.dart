// GENERATED. Do not edit by hand.

/// Explicit configuration for generating a Flare IM Core gateway-compatible HS256 access token.
final class CoreTokenRequest {
  /// wire: `userId`. Subject user id stored in the JWT sub claim.
  final String userId;
  /// wire: `secret`. HS256 signing secret configured on the gateway verifier.
  final String secret;
  /// wire: `issuer`. JWT issuer expected by the gateway verifier.
  final String issuer;
  /// wire: `ttlSecs`. Token lifetime in seconds.
  final int ttlSecs;
  /// wire: `deviceId`. Optional device id claim.
  final String? deviceId;
  /// wire: `tenantId`. Optional tenant id claim.
  final String? tenantId;

  const CoreTokenRequest({
    this.userId = '',
    this.secret = '',
    this.issuer = '',
    this.ttlSecs = 0,
    this.deviceId,
    this.tenantId,
  });
}
