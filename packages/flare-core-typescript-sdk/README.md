# @flare-im/sdk

Flare IM 的 TypeScript 客户端 SDK —— 对 Rust 核心（`flare-im-core-sdk`）的类型化封装。

真正的 IM 逻辑（连接、同步、存储、时间线）全在 Rust 核心里；这个包负责把它接到
各个 JS 运行时上，并提供完整的 TypeScript 类型。

## 安装

```bash
npm install @flare-im/sdk
```

## 按运行时选择入口

不同运行时的传输与存储能力不同，所以入口是分开的 —— 直接从对应子路径导入：

| 运行时 | 导入路径 | 传输 / 存储 |
|---|---|---|
| 浏览器 / H5 | `@flare-im/sdk/web` | WebSocket（WASM）+ IndexedDB |
| Tauri 桌面 | `@flare-im/sdk/tauri` | QUIC + SQLite |
| uni-app | `@flare-im/sdk/uni-app` | 原生核心 |
| React Native | `@flare-im/sdk/react-native` | 原生核心 |

```ts
import { FlareCoreSdk } from "@flare-im/sdk/uni-app";
```

浏览器端换成 `/web`，Tauri 换成 `/tauri`，其余代码不变。

> Tauri 入口需要 peer 依赖 `@tauri-apps/api ^2.0.0`。

## 其它子路径

```ts
import { SdkOperations, SdkEvents } from "@flare-im/sdk/contract";
```

`api` / `listener` / `model` / `callback` / `contract` / `media` / `lifecycle`
分别导出操作、事件监听、数据模型、回调、协议契约、媒体与生命周期。

## 可运行的完整示例

本包是 SDK 层，跑起来需要配套的运行时桥与服务端。完整可运行的应用见仓库
[`examples/`](../../examples/)，其中 `flare-core-uni-app` 是接线最完整的一个。

服务端起法见 flare-im-core 仓库的 `QUICKSTART.md`（五分钟跑通，无需自建用户体系）。

## 给贡献者

**不要在这里加 IM 业务逻辑。** 行为应当加进 `flare-im-core-sdk`（Rust），
经 `bindings/c` 暴露，再更新 `sdk-spec/manifest.json`。这个包只做类型化转发 ——
逻辑下沉到核心才能让七个端共享同一份实现。

- 契约状态：`contract-synced`
- 异步模型：Promise + 事件订阅
- FFI 契约：`flare-im-ffi/v1`

## 许可

Apache-2.0
