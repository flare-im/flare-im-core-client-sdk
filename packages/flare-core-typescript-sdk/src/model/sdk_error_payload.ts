/** GENERATED. Do not edit by hand. */

/** Stable error payload used by lifecycle and async notification failures. */
export interface SdkErrorPayload {
  /** wire: `code`. Stable machine-readable error code. */
  code: string;
  /** wire: `machineReason`. Server's typed reason (ErrorDetail.reason, e.g. a PreSend rejection code); empty or absent for local failures. */
  machineReason?: string;
  /** wire: `message`. Human-readable error message. */
  message: string;
  /** wire: `operation`. Operation that failed. */
  operation?: string;
  /** wire: `retryable`. Whether retrying may succeed. */
  retryable?: boolean;
  /** wire: `details`. Opaque diagnostic details. */
  details: Record<string, string>;
}
