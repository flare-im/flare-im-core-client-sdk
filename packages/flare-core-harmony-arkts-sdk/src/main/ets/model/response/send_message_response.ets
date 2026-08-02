// GENERATED. Do not edit by hand.

/** Send acknowledgement returned by core-sdk. */
export interface SendMessageResponse {
  /** wire: `ackId`. ACK id assigned by the transport layer, if present. */
  ackId: string;
  /** wire: `serverId`. Server-assigned message id. */
  serverId: string;
  /** wire: `clientMsgId`. Client message id acknowledged by the server. */
  clientMsgId: string;
  /** wire: `conversationId`. Conversation id. */
  conversationId: string;
  /** wire: `seq`. Assigned conversation sequence. */
  seq: number;
  /** wire: `timestamp`. Server send time in milliseconds. */
  timestamp: number;
  /** wire: `success`. Whether this response contains a final accepted send ACK. */
  success: boolean;
  /** wire: `errorCode`. Core ACK error code when success is false. */
  errorCode: number;
  /** wire: `errorMessage`. Core ACK error message when success is false. */
  errorMessage: string;
}
