// GENERATED. Do not edit by hand.
import { SendMessageResponse } from '../../response/send_message_response';

/** Message send acknowledgement notification. */
export interface MessageSendAckEvent {
  /** wire: `ack`. Send acknowledgement. */
  ack: SendMessageResponse;
}
