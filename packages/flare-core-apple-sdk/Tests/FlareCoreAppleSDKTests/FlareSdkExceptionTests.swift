import XCTest
@testable import FlareCoreAppleSDK

final class FlareSdkExceptionTests: XCTestCase {
    func testNativeErrorTakesTheStructuredErrorFromDetailsJson() {
        let error = FlareSdkException.fromNative(
            nativeCode: 8,
            message: "错误 [OPERATION_FAILED] sdk.plugin.rejected",
            operation: "capability.dispatch",
            detailsJson: #"{"code":"OPERATION_FAILED","reason":"sdk.plugin.rejected","retryable":false,"httpStatus":422,"remoteCode":3,"machineReason":"CALL_FULL"}"#
        )

        XCTAssertEqual(error.code, "OPERATION_FAILED")
        XCTAssertEqual(error.reason, "sdk.plugin.rejected")
        XCTAssertEqual(error.machineReason, "CALL_FULL")
        XCTAssertEqual(error.httpStatus, 422)
        XCTAssertEqual(error.remoteCode, 3)
        XCTAssertFalse(error.retryable)
        XCTAssertEqual(error.operation, "capability.dispatch")
    }

    func testNativeErrorWithoutDetailsKeepsTheCAbiCode() {
        let error = FlareSdkException.fromNative(
            nativeCode: 5,
            message: "network down",
            operation: nil,
            detailsJson: ""
        )

        XCTAssertEqual(error.code, "native_error_5")
        XCTAssertNil(error.reason)
        XCTAssertNil(error.machineReason)
        XCTAssertNil(error.httpStatus)
    }

    func testARefusalNamesTheRefusedMessagesAsATypedList() {
        let error = FlareSdkException.fromNative(
            nativeCode: 2,
            message: "错误 [INVALID_PARAMETER] sdk.message.forward.not_forwardable: s-2, s-3",
            operation: "message_builder.create_forward",
            detailsJson: #"{"code":"INVALID_PARAMETER","reason":"sdk.message.forward.not_forwardable: s-2, s-3","retryable":false,"refusedMessageIds":["s-2","s-3"]}"#
        )
        XCTAssertEqual(error.code, "INVALID_PARAMETER")
        XCTAssertEqual(error.refusedMessageIds, ["s-2", "s-3"])

        for odd in [#"[]"#, #"["s-2",3]"#, #""s-2,s-3""#, "null"] {
            let other = FlareSdkException.fromNative(
                nativeCode: 2,
                message: "x",
                operation: nil,
                detailsJson: #"{"code":"INVALID_PARAMETER","refusedMessageIds":"# + odd + "}"
            )
            XCTAssertNil(other.refusedMessageIds, odd)
        }
    }

    func testRetryableComesFromCore() {
        let error = FlareSdkException.fromNative(
            nativeCode: 4,
            message: "late",
            operation: nil,
            detailsJson: #"{"code":"OPERATION_TIMEOUT","reason":"late","retryable":true}"#
        )

        XCTAssertEqual(error.code, "OPERATION_TIMEOUT")
        XCTAssertTrue(error.retryable)
    }
}
