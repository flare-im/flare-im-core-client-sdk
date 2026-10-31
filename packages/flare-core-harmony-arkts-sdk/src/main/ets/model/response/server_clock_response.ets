// GENERATED. Do not edit by hand.

/** The core's estimate of how far the server clock is from this device's. */
export interface ServerClockResponse {
  /** wire: `offsetMs`. Server clock minus device clock, in milliseconds; 0 until estimated. */
  offsetMs: number;
  /** wire: `estimated`. Whether the offset rests on a server frame received this session. */
  estimated: boolean;
}
