#!/usr/bin/env node
/**
 * 跨端校验：同一个 wire 字段在各平台必须用与模型类型匹配的编码器。
 *
 * 为什么需要这道门禁：
 * 契约把 BuildForwardMessageRequest.sourceMessages 从 ForwardSourceMessage（id 存根）
 * 改成 Message（完整消息）时，只有 TypeScript 跟上了。Swift / Kotlin / Dart / ArkTS
 * 四个端的编码器都还在调旧的存根编码器 —— 其中三端直接编译不过，
 * iOS / Android / Flutter 三个示例 app 长期无法构建，而这在 CI 里毫无信号。
 *
 * 陷阱（这次真踩了）：每个 WireCodec 里都有**两处长得一模一样**的 sourceMessages 代码块。
 * ForwardContentPayload 那处**本来就该**用 id 存根，只有 BuildForwardMessageRequest
 * 那处要用完整消息。所以这道检查必须**两处都断言**，只查一处会把改错位置放过去。
 */
import { readFileSync, existsSync } from "node:fs";
import { fileURLToPath } from "node:url";
import { dirname, join } from "node:path";

const root = join(dirname(fileURLToPath(import.meta.url)), "..");

/** 每项：平台、编解码器路径、函数名、期望使用的编码器（正则片段）。 */
const RULES = [
  {
    platform: "TypeScript",
    file: "packages/flare-core-typescript-sdk/src/adapter/codec/wireCodec.ts",
    cases: [
      { fn: "buildForwardMessageRequestToMap", expect: "messageToMap", forbid: "forwardSourceMessageToMap" },
      { fn: "forwardContentPayloadToMap", expect: "forwardSourceMessageToMap", forbid: null },
    ],
  },
  {
    platform: "Swift",
    file: "packages/flare-core-apple-sdk/Sources/FlareCoreAppleSDK/Adapter/Codec/WireCodec.swift",
    cases: [
      { fn: "buildForwardMessageRequestToMap", expect: "messageToWireMap", forbid: "forwardSourceMessageToMap" },
      { fn: "forwardContentPayloadToMap", expect: "forwardSourceMessageToMap", forbid: null },
    ],
  },
  {
    platform: "Kotlin",
    file: "packages/flare-core-android-sdk/src/main/kotlin/com/flare/im/adapter/codec/WireCodec.kt",
    cases: [
      { fn: "buildForwardMessageRequestToMap", expect: "messageToWireMap", forbid: "forwardSourceMessageToMap" },
      { fn: "forwardContentPayloadToMap", expect: "forwardSourceMessageToMap", forbid: null },
    ],
  },
  {
    platform: "ArkTS",
    file: "packages/flare-core-harmony-arkts-sdk/src/main/ets/adapter/codec/WireCodec.ets",
    cases: [
      { fn: "buildForwardMessageRequestToMap", expect: "messageToMap", forbid: "forwardSourceMessageToMap" },
      { fn: "forwardContentPayloadToMap", expect: "forwardSourceMessageToMap", forbid: null },
    ],
  },
];

/** 取出某个函数体（到下一个同级函数定义或文件结束为止）。 */
function functionBody(source, fnName) {
  const start = source.indexOf(fnName);
  if (start < 0) return null;
  const rest = source.slice(start);
  // 下一个函数定义的起点：各语言的关键字都覆盖到
  const next = rest.slice(1).search(/\n(?:export )?(?:fun |func |function |suspend fun )/);
  return next < 0 ? rest : rest.slice(0, next + 1);
}

const failures = [];
let checked = 0;

for (const rule of RULES) {
  const path = join(root, rule.file);
  if (!existsSync(path)) {
    failures.push(`${rule.platform}: 找不到 ${rule.file}（路径变了就更新本脚本，别删检查）`);
    continue;
  }
  const source = readFileSync(path, "utf-8");
  for (const c of rule.cases) {
    const body = functionBody(source, c.fn);
    if (!body) {
      failures.push(`${rule.platform}: ${rule.file} 里找不到 ${c.fn}`);
      continue;
    }
    checked += 1;
    if (!body.includes(c.expect)) {
      failures.push(`${rule.platform}.${c.fn}: 应使用 ${c.expect}，实际没有`);
    }
    if (c.forbid && body.includes(c.forbid)) {
      failures.push(
        `${rule.platform}.${c.fn}: 仍在使用 ${c.forbid}。` +
          `sourceMessages 是完整消息而不是 id 存根 —— 核心侧 forward_item_from_source ` +
          `要读 content / senderId / conversationId，传存根会 INVALID_PARAMETER。`,
      );
    }
  }
}

if (failures.length) {
  console.error("wire 编码器与模型类型不一致：\n");
  for (const f of failures) console.error("  ✗ " + f);
  console.error(`\n共 ${failures.length} 项。`);
  process.exit(1);
}
console.log(`wire 编码器一致性检查通过（${RULES.length} 个平台 / ${checked} 处）`);
