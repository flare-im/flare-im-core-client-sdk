/**
 * GENERATED. Do not edit by hand.
 *
 * Module API: `capabilities` — Capability discovery and optional plugin dispatch through capability dispatch ops.
 */
import type { PluginCommandRequest, PluginUiEvaluationRequest } from '../../model';
import type { DispatchCapabilityRequest, DispatchCapabilityResponse, GrantCapabilityRequest, JsonObject, ListCapabilitiesRequest, ListCapabilitiesResponse, ListUserCapabilitiesRequest, ListUserCapabilitiesResponse, RevokeCapabilityRequest, SendCallSignalRequest } from '../types';

/** Capability discovery and optional plugin dispatch through capability dispatch ops. */
export interface CapabilitiesApi {
  /** preparePluginCommand maps to `flare_capability_dispatch_json`, dispatch op `prepare_plugin_command`. Operation: `capability.prepare_plugin_command`. */
  preparePluginCommand(request: PluginCommandRequest): Promise<JsonObject>;
  /** pendingPluginCommand maps to `flare_capability_dispatch_json`, dispatch op `pending_plugin_command`. Operation: `capability.pending_plugin_command`. */
  pendingPluginCommand(request: PluginCommandRequest): Promise<JsonObject>;
  /** reconcilePluginCommand maps to `flare_capability_dispatch_json`, dispatch op `reconcile_plugin_command`. Operation: `capability.reconcile_plugin_command`. */
  reconcilePluginCommand(request: PluginCommandRequest): Promise<JsonObject>;
  /** submitPluginCommand maps to `flare_capability_dispatch_json`, dispatch op `submit_plugin_command`. Operation: `capability.submit_plugin_command`. */
  submitPluginCommand(request: PluginCommandRequest): Promise<JsonObject>;
  /** acknowledgePluginCommand maps to `flare_capability_dispatch_json`, dispatch op `acknowledge_plugin_command`. Operation: `capability.acknowledge_plugin_command`. */
  acknowledgePluginCommand(request: PluginCommandRequest): Promise<JsonObject>;
  /** invokePluginAction maps to `flare_capability_dispatch_json`, dispatch op `plugin_ui_invoke`. Operation: `capability.plugin_ui_invoke`. */
  invokePluginAction(request: PluginUiEvaluationRequest): Promise<JsonObject>;
  /** presentPluginMessage maps to `flare_capability_dispatch_json`, dispatch op `plugin_ui_present`. Operation: `capability.plugin_ui_present`. */
  presentPluginMessage(request: PluginUiEvaluationRequest): Promise<JsonObject>;
  /** pluginUiAction maps to `flare_capability_dispatch_json`, dispatch op `plugin_ui_action`. Operation: `capability.plugin_ui_action`. */
  pluginUiAction(request: PluginUiEvaluationRequest): Promise<JsonObject>;
  /** resolvePluginMessage maps to `flare_capability_dispatch_json`, dispatch op `plugin_ui_resolve`. Operation: `capability.plugin_ui_resolve`. */
  resolvePluginMessage(request: PluginUiEvaluationRequest): Promise<JsonObject>;
  /** pluginUiCatalog maps to `flare_capability_dispatch_json`, dispatch op `plugin_ui_catalog`. Operation: `capability.plugin_ui_catalog`. */
  pluginUiCatalog(request: ListCapabilitiesRequest): Promise<JsonObject>;
  /** listCapabilities maps to `flare_capability_dispatch_json`, dispatch op `capability_list`. Operation: `capability.list`. */
  listCapabilities(request: ListCapabilitiesRequest): Promise<ListCapabilitiesResponse>;
  /** listUserCapabilities maps to `flare_capability_dispatch_json`, dispatch op `capability_list_user`. Operation: `capability.list_user`. */
  listUserCapabilities(request: ListUserCapabilitiesRequest): Promise<ListUserCapabilitiesResponse>;
  /** dispatchCapability maps to `flare_capability_dispatch_json`, dispatch op `capability_dispatch`. Operation: `capability.dispatch`. */
  dispatchCapability(request: DispatchCapabilityRequest): Promise<DispatchCapabilityResponse>;
  /** grantCapability maps to `flare_capability_dispatch_json`, dispatch op `capability_grant`. Operation: `capability.grant`. */
  grantCapability(request: GrantCapabilityRequest): Promise<void>;
  /** revokeCapability maps to `flare_capability_dispatch_json`, dispatch op `capability_revoke`. Operation: `capability.revoke`. */
  revokeCapability(request: RevokeCapabilityRequest): Promise<void>;
  /** sendCallSignal maps to `flare_capability_dispatch_json`, dispatch op `send_call_signal`. Operation: `capability.send_call_signal`. */
  sendCallSignal(request: SendCallSignalRequest): Promise<void>;
}
