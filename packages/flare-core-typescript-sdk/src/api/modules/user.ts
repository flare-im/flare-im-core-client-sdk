/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `user` — User profile cache (business-fed identity for messages and conversations).
 */
import type { UpsertUserProfilesRequest } from '../types';

/** User profile cache (business-fed identity for messages and conversations). */
export interface UserApi {
  /** upsertUserProfiles maps to `flare_sdk_invoke_json`. Operation: `user.upsert_profiles`. */
  upsertUserProfiles(request: UpsertUserProfilesRequest): Promise<void>;
}
