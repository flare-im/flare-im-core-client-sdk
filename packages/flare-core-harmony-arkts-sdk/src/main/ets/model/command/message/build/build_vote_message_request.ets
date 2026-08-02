// GENERATED. Do not edit by hand.

/** Build a vote message. */
export interface BuildVoteMessageRequest {
  /** wire: `conversationId`. Target conversation id. */
  conversationId: string;
  /** wire: `voteId`. Vote id. */
  voteId: string;
  /** wire: `title`. Vote title. */
  title: string;
  /** wire: `options`. Vote options. */
  options: Array<string>;
  /** wire: `participantUserIds`. Participants allowed to vote. */
  participantUserIds: Array<string>;
}
