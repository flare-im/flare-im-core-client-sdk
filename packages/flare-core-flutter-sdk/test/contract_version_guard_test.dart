import 'package:flare_core_flutter_sdk/src/bridge/contract_version_guard.dart';
import 'package:flare_core_flutter_sdk/src/contract/contract.dart';
import 'package:flare_core_flutter_sdk/src/flare_core_sdk.dart';
import 'package:test/test.dart';

void main() {
  group('assertFfiContractVersion', () {
    test('accepts the generated FFI contract version string', () {
      expect(
        () => assertFfiContractVersion(kFlareFfiContractVersion),
        returnsNormally,
      );
    });

    test('rejects missing native contract version', () {
      expect(
        () => assertFfiContractVersion(''),
        throwsA(
          isA<FlareSdkException>()
              .having(
                  (error) => error.code, 'code', 'contract.version_unavailable')
              .having((error) => error.operation, 'operation',
                  kFfiContractVersionOperation),
        ),
      );
    });

    test('rejects mismatched native contract version', () {
      expect(
        () => assertFfiContractVersion('flare-im-ffi/v0'),
        throwsA(
          isA<FlareSdkException>()
              .having(
                  (error) => error.code, 'code', 'contract.version_mismatch')
              .having((error) => error.operation, 'operation',
                  kFfiContractVersionOperation)
              .having((error) => error.details, 'details',
                  containsPair('expected', kFlareFfiContractVersion))
              .having((error) => error.details, 'details',
                  containsPair('actual', 'flare-im-ffi/v0')),
        ),
      );
    });
  });
}
