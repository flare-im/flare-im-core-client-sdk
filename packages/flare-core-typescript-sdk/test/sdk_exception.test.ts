import { describe, expect, it } from "vitest";

import { FlareSdkException } from "../src/bridge/flareSdkException";

describe("FlareSdkException.fromBindingError", () => {
  it("names the messages an operation refused as a typed list", () => {
    const error = FlareSdkException.fromBindingError({
      code: "INVALID_PARAMETER",
      reason: "sdk.message.forward.not_forwardable: s-2, s-3",
      retryable: false,
      refusedMessageIds: ["s-2", "s-3"],
      message: "错误 [INVALID_PARAMETER] sdk.message.forward.not_forwardable: s-2, s-3",
    }, "message_builder.create_forward");

    expect(error).toBeInstanceOf(FlareSdkException);
    expect(error?.code).toBe("INVALID_PARAMETER");
    expect(error?.refusedMessageIds).toEqual(["s-2", "s-3"]);
    expect(error?.operation).toBe("message_builder.create_forward");
  });

  it("keeps no refused list that is not a non-empty list of strings", () => {
    for (const odd of [[], ["s-2", 3], "s-2,s-3", null, { 0: "s-2" }]) {
      const error = FlareSdkException.fromBindingError({ code: "INVALID_PARAMETER", refusedMessageIds: odd });
      expect(error?.refusedMessageIds, JSON.stringify(odd)).toBeUndefined();
    }
  });
});
