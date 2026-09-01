import { describe, expect, it, vi } from "vitest";

import { WebProductionBridge } from "./webProductionBridge";

function storageHostStub() {
  return {
    loadSnapshot: async () => "{}",
    saveMessage: async () => {},
    saveConversation: async () => {},
    saveCursor: async () => {},
    savePendingSend: async () => {},
    deleteMessage: async () => {},
    deleteConversation: async () => {},
    deletePendingSend: async () => {},
  };
}

describe("WebProductionBridge invoke chain", () => {
  it("一次挂死的 WASM 调用不能永久堵住后续调用", async () => {
    const errors: string[] = [];
    const errorSpy = vi.spyOn(console, "error").mockImplementation((...args) => {
      errors.push(args.map(String).join(" "));
    });
    try {
      let loads = 0;
      // 只有**全局第一次**调用永不 settle（模拟 WASM 挂死）；
      // 计数器放在 runtime 外面，否则重建 runtime 会把"已经挂过一次"忘掉。
      let calls = 0;
      const makeRuntime = () => ({
        invoke: vi.fn(async (_op: string, _payload: string) => {
          calls += 1;
          if (calls === 1) {
            return await new Promise<never>(() => {});
          }
          return JSON.stringify({ ok: true });
        }),
        setEventCallback: vi.fn(),
        setStorageHost: vi.fn(),
      });
      const bridge = new WebProductionBridge({
        loadRuntime: async () => {
          loads += 1;
          return { runtime: makeRuntime() as never };
        },
        createStorageHost: () => storageHostStub() as never,
      });

      // conversation.update_draft 的外层超时是 5s，链条宽限期再加 5s
      const stuck = bridge.invoke({ operation: "conversation.update_draft" } as never, {}).catch(
        (error: unknown) => `失败:${(error as Error).message.slice(0, 20)}`,
      );
      expect(await stuck).toContain("失败:");   // 5s 外层超时

      // 关键断言：宽限期过后，后续调用必须能跑起来，而不是无限排队
      // 修复前：这一句会永远挂着（invokeChain 被卡死），测试因超时失败
      const next = bridge.invoke({ operation: "conversation.list" } as never, {});
      await expect(next).resolves.toBeDefined();

      expect(loads).toBeGreaterThan(1);   // 旧 runtime 被丢弃并重建
      expect(errors.join(" ")).toContain("never settled");
      expect(errors.join(" ")).toContain("conversation.update_draft");   // 日志要点名卡住的操作
    } finally {
      errorSpy.mockRestore();
    }
  }, 40_000);
});
