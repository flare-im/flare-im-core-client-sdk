// GENERATED. Do not edit by hand.
import 'forward_source_message.dart';

/// Forward message payload.
final class ForwardContentPayload {
  /// wire: `merge`. Merge forwarded messages into one card.
  final bool? merge;
  /// wire: `title`. Forward title.
  final String? title;
  /// wire: `sourceMessages`. Forwarded sources.
  final List<ForwardSourceMessage> sourceMessages;

  const ForwardContentPayload({
    this.merge,
    this.title,
    this.sourceMessages = const [],
  });
}
