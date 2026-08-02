import XCTest
@testable import FlareCoreAppleSDK

final class FfiContractVersionGuardTests: XCTestCase {
    func testAcceptsGeneratedFfiContractVersion() throws {
        XCTAssertNoThrow(try FfiContractVersionGuard.validate(SdkContract.ffiContractVersion))
    }

    func testRejectsMissingNativeContractVersion() throws {
        do {
            try FfiContractVersionGuard.validate("")
            XCTFail("expected contract.version_unavailable")
        } catch let error as FlareSdkException {
            XCTAssertEqual(error.code, "contract.version_unavailable")
            XCTAssertEqual(error.operation, SdkOperations.diagnosticsFfiContractVersion)
            XCTAssertEqual(error.details["expected"], SdkContract.ffiContractVersion)
            XCTAssertEqual(error.details["transport"], "ffi")
        }
    }

    func testRejectsMismatchedNativeContractVersion() throws {
        do {
            try FfiContractVersionGuard.validate("flare-im-ffi/v0")
            XCTFail("expected contract.version_mismatch")
        } catch let error as FlareSdkException {
            XCTAssertEqual(error.code, "contract.version_mismatch")
            XCTAssertEqual(error.operation, SdkOperations.diagnosticsFfiContractVersion)
            XCTAssertEqual(error.details["expected"], SdkContract.ffiContractVersion)
            XCTAssertEqual(error.details["actual"], "flare-im-ffi/v0")
            XCTAssertEqual(error.details["transport"], "ffi")
        }
    }
}
