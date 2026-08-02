import 'package:flare_core_flutter_sdk/src/api/connection_state.dart';
import 'package:flare_core_flutter_sdk/src/bridge/ffi_native_bridge.dart';
import 'package:flare_core_flutter_sdk/src/flare_core_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('FFI connection state code mapping', () {
    test('maps native disconnected code zero', () {
      expect(
        connectionStateFromFfiStateCode(0),
        ConnectionState.disconnected,
      );
    });

    test('keeps unknown native state codes explicit failures', () {
      expect(
        () => connectionStateFromFfiStateCode(99),
        throwsA(
          isA<FlareSdkException>().having(
            (error) => error.message,
            'message',
            'invalid connection state code: 99',
          ),
        ),
      );
    });
  });
}
