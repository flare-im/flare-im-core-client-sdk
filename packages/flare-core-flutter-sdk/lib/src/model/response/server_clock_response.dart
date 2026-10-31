// GENERATED. Do not edit by hand.

/// The core's estimate of how far the server clock is from this device's.
final class ServerClockResponse {
  /// wire: `offsetMs`. Server clock minus device clock, in milliseconds; 0 until estimated.
  final int offsetMs;
  /// wire: `estimated`. Whether the offset rests on a server frame received this session.
  final bool estimated;

  const ServerClockResponse({
    this.offsetMs = 0,
    this.estimated = false,
  });
}
