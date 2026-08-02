// GENERATED. Do not edit by hand.
// Module API: `user` — User profile cache (business-fed identity for messages and conversations).

/// User profile cache (business-fed identity for messages and conversations).
abstract interface class UserApi {
  /// upsertUserProfiles maps to `flare_sdk_invoke_json` via `contract-invoke-json`. Operation: `user.upsert_profiles`.
  Future<void> upsertUserProfiles(Map<String, Object?> request);
}
