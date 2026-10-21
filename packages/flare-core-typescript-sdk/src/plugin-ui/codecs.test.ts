import { describe, expect, it } from "vitest";
import { buildPluginMessageRequestToMap, pluginUiEvaluationRequestToMap } from "../adapter/codec/wireCodec";

describe("generated plugin request codecs", () => {
  it("preserves the generic message envelope across the generated binding", () => {
    const payload = { pluginId: "example.poll", contributionId: "example.poll.card", schemaVersion: 1, summary: "Poll", payload: { id: "one" } };
    expect(buildPluginMessageRequestToMap({ conversationId: "group-1", payload })).toEqual({ conversationId: "group-1", payload });
  });
  it("preserves nested UI evaluation data", () => {
    const payload = { catalog: { tenantId: "201" }, message: { payload: { count: 2 } }, platform: "web" };
    expect(pluginUiEvaluationRequestToMap({ payload })).toEqual({ payload });
  });
});
