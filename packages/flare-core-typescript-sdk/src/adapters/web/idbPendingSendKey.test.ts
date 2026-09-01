import { describe, expect, it } from "vitest";

import { __testing } from "./idbWasmStorageHost";

describe("pending send 主键推导", () => {
  const { pendingSendKey, pendingSendClientMsgId } = __testing;

  it("必须认 snake_case wire —— PendingSendVo 与 Message 的命名不同", () => {
    // 线上就是这个形态：client_msg_id / conversation_id / message / enqueued_at_ms
    const entry = { client_msg_id: "abc123", conversation_id: "2AX", message: {} };
    expect(pendingSendClientMsgId(entry)).toBe("abc123");
    expect(pendingSendKey("u1", entry)).toBe("u1::abc123");
  });

  it("camelCase 也认（不同调用方的 wire 可能不一致）", () => {
    expect(pendingSendKey("u1", { clientMsgId: "abc123" })).toBe("u1::abc123");
  });

  it("拿不到 id 时返回 null，绝不回退到随机 id", () => {
    // 回归：曾经回退成 cryptoSafeId()，主键成了随机 UUID，
    // 而删除按真实 client_msg_id 拼键 —— 那些行**永远删不掉**，
    // 只增不减，且每次登录被重新水化、把已送达的消息再发一遍。
    expect(pendingSendKey("u1", {})).toBeNull();
    expect(pendingSendKey("u1", { client_msg_id: "   " })).toBeNull();
  });

  it("同一条目的键必须稳定 —— 否则写入与删除对不上", () => {
    const entry = { client_msg_id: "same-id" };
    expect(pendingSendKey("u1", entry)).toBe(pendingSendKey("u1", entry));
    // 删除侧拼的是 `${userId}::${client_msg_id}`，必须与写入侧一致
    expect(pendingSendKey("u1", entry)).toBe("u1::same-id");
  });
});
