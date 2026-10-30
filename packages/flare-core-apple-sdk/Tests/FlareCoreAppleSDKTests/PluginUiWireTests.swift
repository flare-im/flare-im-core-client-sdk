import XCTest
@testable import FlareCoreAppleSDK

final class PluginUiWireTests: XCTestCase {
    func testPluginUiEvaluationKeepsTheNestedPayload() {
        let payload: [String: AnySendable] = [
            "pluginId": AnySendable("example.notice"),
            "data": AnySendable(["resourceId": "notice-1"])
        ]
        let evaluation = FfiJson.asMap(pluginUiEvaluationRequestToMap(PluginUiEvaluationRequest(payload: payload)))
        let envelope = evaluation["payload"] as? [String: Any]
        XCTAssertEqual(envelope?["pluginId"] as? String, "example.notice")
        XCTAssertEqual((envelope?["data"] as? [String: String])?["resourceId"], "notice-1")
    }
}
