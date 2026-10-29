// GENERATED. Do not edit by hand.
import { PluginCatalogChangedEvent, PluginRealtimeEvent } from '../model';

/** Plugin listener callbacks. */
export interface PluginEventListener {
  /** A plugin delivered a realtime packet to this user's online connections (im.realtime.deliver): online only, at most once, never stored. Expired packets and payloads that are not JSON objects never arrive. Route by pluginId and packetType. */
  onPluginRealtime?(event: PluginRealtimeEvent): void;
  /** The tenant's plugin catalog changed (a plugin enabled, disabled or reconfigured). The SDK has already invalidated its plugin catalog; read plugin entries and configuration again. Arrives a random 0-3 s after the notice, with the notices of 3 s merged into one. */
  onPluginCatalogChanged?(event: PluginCatalogChangedEvent): void;
}
