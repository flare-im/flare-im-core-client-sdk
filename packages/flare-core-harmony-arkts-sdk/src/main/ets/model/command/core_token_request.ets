// GENERATED. Do not edit by hand.

/** Explicit configuration for generating a Flare IM Core gateway-compatible HS256 access token. */
export interface CoreTokenRequest {
  /** wire: `userId`. Subject user id stored in the JWT sub claim. */
  userId: string;
  /** wire: `secret`. HS256 signing secret configured on the gateway verifier. */
  secret: string;
  /** wire: `issuer`. JWT issuer expected by the gateway verifier. */
  issuer: string;
  /** wire: `ttlSecs`. Token lifetime in seconds. */
  ttlSecs: number;
  /** wire: `deviceId`. Optional device id claim. */
  deviceId?: string;
  /** wire: `tenantId`. Optional tenant id claim. */
  tenantId?: string;
}
