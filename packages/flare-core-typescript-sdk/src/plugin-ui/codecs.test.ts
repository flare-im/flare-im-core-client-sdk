import { describe, expect, it } from "vitest";
import { pluginUiEvaluationRequestToMap } from "../adapter/codec/wireCodec";

describe("generated plugin request codecs", () => {
  it("preserves nested UI evaluation data", () => {
    const payload = { catalog: { tenantId: "201" }, message: { payload: { count: 2 } }, platform: "web" };
    expect(pluginUiEvaluationRequestToMap({ payload })).toEqual({ payload });
  });
});
