import XCTest
@testable import FlareCoreAppleSDK

final class FfiCallbackRouterTests: XCTestCase {
    func testFfiJsonAsMapUnwrapsAnySendableDictionary() {
        let payload: [String: AnySendable] = [
            "userId": AnySendable("11"),
            "nested": AnySendable(["tenantId": AnySendable("0")])
        ]

        let map = FfiJson.asMap(AnySendable(payload))

        XCTAssertEqual(map["userId"] as? String, "11")
        XCTAssertEqual((map["nested"] as? [String: Any])?["tenantId"] as? String, "0")
        XCTAssertEqual(FfiFields.string(AnySendable(payload), "userId"), "11")
    }

    func testStartErrorAfterCallbackDoesNotResumeContinuationTwice() async throws {
        let router = FfiCallbackRouter.shared
        let id = router.reserveContextId()

        do {
            _ = try await router.wait(for: id, operation: "sdk.login") { _ in
                router.complete(id: id, result: ["ok": true], error: nil)
                return 10
            }
            XCTFail("expected start error to win after callback raced with synchronous failure")
        } catch let error as FlareSdkException {
            XCTAssertEqual(error.code, "native_error_10")
            XCTAssertEqual(error.operation, "sdk.login")
        }
    }

    func testTypingAggregateEventDecodesAndFansOut() async throws {
        let bridge = RecordingNativeBridge()
        let events = DefaultEventsApi(bridge: bridge)
        let typedBox = TypingAggregateBox()
        let listener = TypingAggregateListener()

        _ = events.onTypingAggregateChanged { event in
            typedBox.event = event
        }
        _ = events.addEventListener(listener)

        _ = try await events.subscribeEvents([:])
        bridge.emit(eventType: EventCode.messageTypingAggregate, payload: [
            "conversationId": "group-100",
            "typingUserIds": ["user-a", "user-b"],
            "typingCount": 2,
        ])

        XCTAssertEqual(typedBox.event?.conversationId, "group-100")
        XCTAssertEqual(typedBox.event?.typingUserIds, ["user-a", "user-b"])
        XCTAssertEqual(typedBox.event?.typingCount, 2)
        XCTAssertEqual(listener.event?.conversationId, "group-100")
        XCTAssertEqual(listener.event?.typingCount, 2)
    }
}

private final class RecordingNativeBridge: NativeBridgeProtocol {
    private var handler: ((Int, Any?) -> Void)?

    func invoke(_ descriptor: NativeCallDescriptor, request: AnySendable?) async throws -> AnySendable {
        if descriptor.operation == SdkOperations.eventSubscribe || descriptor.operation == SdkOperations.eventSubscribeBatch {
            let map = request?.value as? [String: Any]
            handler = map?["handler"] as? (Int, Any?) -> Void
            return AnySendable([String: Any]())
        }
        return AnySendable([String: Any]())
    }

    func emit(eventType: Int, payload: [String: Any]) {
        handler?(eventType, payload)
    }
}

private final class TypingAggregateBox: @unchecked Sendable {
    var event: TypingAggregateEvent?
}

private final class TypingAggregateListener: FlareImEventListener {
    var event: TypingAggregateEvent?

    func onTypingAggregateChanged(_ event: TypingAggregateEvent) {
        self.event = event
    }
}
