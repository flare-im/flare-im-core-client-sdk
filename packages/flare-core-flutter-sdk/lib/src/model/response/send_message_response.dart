// GENERATED. Do not edit by hand.

/// Send acknowledgement returned by core-sdk.
final class SendMessageResponse {
  /// wire: `ackId`. ACK id assigned by the transport layer, if present.
  final String ackId;
  /// wire: `serverId`. Server-assigned message id.
  final String serverId;
  /// wire: `clientMsgId`. Client message id acknowledged by the server.
  final String clientMsgId;
  /// wire: `conversationId`. Conversation id.
  final String conversationId;
  /// wire: `seq`. Assigned conversation sequence.
  final int seq;
  /// wire: `timestamp`. Server send time in milliseconds.
  final int timestamp;
  /// wire: `success`. Whether this response contains a final accepted send ACK.
  final bool success;
  /// wire: `errorCode`. Core ACK error code when success is false.
  final int errorCode;
  /// wire: `errorMessage`. Core ACK error message when success is false.
  final String errorMessage;

  const SendMessageResponse({
    this.ackId = '',
    this.serverId = '',
    this.clientMsgId = '',
    this.conversationId = '',
    this.seq = 0,
    this.timestamp = 0,
    this.success = false,
    this.errorCode = 0,
    this.errorMessage = '',
  });
}
