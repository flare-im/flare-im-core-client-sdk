import 'package:flare_core_flutter_sdk/src/flare_core_sdk.dart';
import 'package:test/test.dart';

void main() {
  test('a native error takes the structured error the SDK wrote in details_json', () {
    final error = FlareSdkException.fromNative(
      nativeCode: 8,
      message: '错误 [OPERATION_FAILED] sdk.plugin.rejected',
      operation: 'capability.dispatch',
      details: {
        'code': 'OPERATION_FAILED',
        'reason': 'sdk.plugin.rejected',
        'retryable': false,
        'httpStatus': 422,
        'machineReason': 'CALL_FULL',
      },
    );
    expect(error.code, 'OPERATION_FAILED');
    expect(error.reason, 'sdk.plugin.rejected');
    expect(error.machineReason, 'CALL_FULL');
    expect(error.httpStatus, 422);
    expect(error.retryable, isFalse);
    expect(error.operation, 'capability.dispatch');
  });

  test('a native error without details keeps the C ABI code', () {
    final error = FlareSdkException.fromNative(
      nativeCode: 5,
      message: 'network down',
      operation: 'sdk.login',
      details: null,
    );
    expect(error.code, 'native_error_5');
    expect(error.reason, isNull);
    expect(error.machineReason, isNull);
  });
}
