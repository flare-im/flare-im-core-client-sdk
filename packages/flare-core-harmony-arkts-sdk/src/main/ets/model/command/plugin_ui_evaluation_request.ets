// GENERATED. Do not edit by hand.

/**  */
export interface PluginUiEvaluationRequest {
  /** wire: `payload`. Typed UI evaluation envelope defined by the shared UI protocol. presentPluginMessage, invokePluginAction and pluginDetail accept an optional messageId (server id or clientMsgId) of the message the card belongs to: the card resolves over the shared and local state layers stored on that message, and invoke stores a successful operation's data.sharedState and data.messageState on it. invokePluginAction also takes formValues and selection; pluginDetail also takes cursor and previous for the next page of a paged detail. */
  payload: Record<string, Object>;
}
