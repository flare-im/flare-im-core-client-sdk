/** GENERATED. Do not edit by hand. */

/** PushTokenInput */
export interface PushTokenInput {
  /** wire: `platform`. Native platform: android, ios or harmony. */
  platform: string;
  /** wire: `provider`. OS delivery provider: fcm, apns or getui. */
  provider: string;
  /** wire: `token`. OS-issued token. Never log or persist outside protected native storage. */
  token: string;
}
