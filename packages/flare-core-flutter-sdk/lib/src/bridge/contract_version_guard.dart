import '../contract/contract.dart' show kFlareFfiContractVersion;
import '../flare_core_sdk.dart';

const String kFfiContractVersionOperation = 'diagnostics.ffi_contract_version';

void assertFfiContractVersion(String value) {
  final actual = value.trim();
  if (actual.isEmpty) {
    throw FlareSdkException(
      code: 'contract.version_unavailable',
      message: 'Native binding contract version is required.',
      operation: kFfiContractVersionOperation,
      details: {
        'expected': kFlareFfiContractVersion,
        'transport': 'ffi',
      },
    );
  }
  if (actual != kFlareFfiContractVersion) {
    throw FlareSdkException(
      code: 'contract.version_mismatch',
      message:
          'Native binding contract version $actual does not match SDK $kFlareFfiContractVersion.',
      operation: kFfiContractVersionOperation,
      details: {
        'expected': kFlareFfiContractVersion,
        'actual': actual,
        'transport': 'ffi',
      },
    );
  }
}
