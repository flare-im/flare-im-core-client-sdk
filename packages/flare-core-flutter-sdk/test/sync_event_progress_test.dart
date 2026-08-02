import 'package:flare_core_flutter_sdk/src/adapter/events/default_events_api.dart';
import 'package:flare_core_flutter_sdk/src/model/event/event_code.dart';
import 'package:flare_core_flutter_sdk/src/model/event/sync/sync_event.dart';
import 'package:test/test.dart';

void main() {
  group('syncEventFromCode progress decode never throws', () {
    SyncEvent decode(Object? progress) => syncEventFromCode(
          EventCode.syncProgress,
          {'progress': progress},
        );

    test('null progress (e.g. finished event) decodes to null', () {
      expect(decode(null).progress, isNull);
    });

    test('0-1 ratio float (historic core bug) rounds to 0..100, no throw', () {
      // core once emitted ratio() in [0,1]; 0.5 previously threw FormatException
      // that bubbled to go_router redirect and crashed the app.
      expect(decode(0.5).progress, 1);
      expect(decode(0.0).progress, 0);
      expect(decode(1.0).progress, 1);
    });

    test('0-100 percentage (fixed core contract) passes through', () {
      expect(decode(0).progress, 0);
      expect(decode(50).progress, 50);
      expect(decode(100).progress, 100);
      expect(decode(33.4).progress, 33);
    });

    test('out-of-range / non-finite / non-number degrade safely', () {
      expect(decode(150).progress, 100);
      expect(decode(-5).progress, 0);
      expect(decode(double.nan).progress, isNull);
      expect(decode(double.infinity).progress, isNull);
      expect(decode('not a number').progress, isNull);
      expect(decode('75').progress, 75);
    });
  });
}
