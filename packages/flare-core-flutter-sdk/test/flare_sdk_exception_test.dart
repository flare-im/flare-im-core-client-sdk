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

  test('a refusal names the refused messages as a typed list', () {
    final error = FlareSdkException.fromNative(
      nativeCode: 2,
      message: '错误 [INVALID_PARAMETER] sdk.message.forward.not_forwardable: s-2, s-3',
      operation: 'message_builder.create_forward',
      details: {
        'code': 'INVALID_PARAMETER',
        'reason': 'sdk.message.forward.not_forwardable: s-2, s-3',
        'retryable': false,
        'refusedMessageIds': ['s-2', 's-3'],
      },
    );
    expect(error.code, 'INVALID_PARAMETER');
    expect(error.refusedMessageIds, ['s-2', 's-3']);
    for (final odd in [
      <Object?>[],
      ['s-2', 3],
      's-2,s-3',
      null,
    ]) {
      final other = FlareSdkException.fromNative(
        nativeCode: 2,
        message: 'x',
        operation: null,
        details: {'code': 'INVALID_PARAMETER', 'refusedMessageIds': odd},
      );
      expect(other.refusedMessageIds, isNull, reason: '$odd');
    }
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
