/** GENERATED. Do not edit by hand. */

/**  */
export interface PluginCommandRequest {
  /** wire: `payload`. prepare: slot + command; pending: slot; submit/acknowledge: slot + commandId. Scope is inferred from the active SDK session. */
  payload: Record<string, unknown>;
}
