import 'package:flare_core_flutter_sdk/src/adapter/codec/wire_codec.dart';
import 'package:test/test.dart';

void main() {
  group('serverClockResponseFromJson', () {
    test('reads an offset in either direction', () {
      final ahead = serverClockResponseFromJson({
        'offsetMs': -300000,
        'estimated': true,
      });
      expect(ahead.offsetMs, -300000);
      expect(ahead.estimated, isTrue);

      final behind = serverClockResponseFromJson({
        'offsetMs': 180000.0,
        'estimated': true,
      });
      expect(behind.offsetMs, 180000);
    });

    test('a missing or unreadable estimate is the device clock', () {
      for (final raw in <Map<String, Object?>>[
        {},
        {'offsetMs': 'soon', 'estimated': 'yes'},
        {'offsetMs': 1.5, 'estimated': true},
      ]) {
        final clock = serverClockResponseFromJson(raw);
        expect(clock.offsetMs, 0, reason: '$raw');
      }
      expect(serverClockResponseFromJson({}).estimated, isFalse);
    });
  });
}
