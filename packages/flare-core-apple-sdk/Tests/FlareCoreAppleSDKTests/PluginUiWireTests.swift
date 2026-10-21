import XCTest
@testable import FlareCoreAppleSDK

final class PluginUiWireTests: XCTestCase {
    func testPluginPayloadKeepsNestedEnvelopeAndConversation() {
        let payload: [String: AnySendable] = [
            "pluginId": AnySendable("example.notice"),
            "data": AnySendable(["resourceId": "notice-1"])
        ]
        let wire = buildPluginMessageRequestToMap(BuildPluginMessageRequest(conversationId: "c1", payload: payload))
        let normalized = FfiJson.asMap(wire)
        XCTAssertEqual(normalized["conversationId"] as? String, "c1")
        let envelope = normalized["payload"] as? [String: Any]
        XCTAssertEqual(envelope?["pluginId"] as? String, "example.notice")
        XCTAssertEqual((envelope?["data"] as? [String: String])?["resourceId"], "notice-1")
        let evaluation = FfiJson.asMap(pluginUiEvaluationRequestToMap(PluginUiEvaluationRequest(payload: payload)))
        XCTAssertNotNil(evaluation["payload"] as? [String: Any])
    }
}
