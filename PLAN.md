# Multi-runtime transport & storage — implementation

> Design source: [docs/design/transport-storage-multiruntime.md](docs/design/transport-storage-multiruntime.md)

## Goal
让每个 runtime 的传输/存储剖面有单一权威、并真正兑现:Web/uni-H5 = WS+IndexedDB;
Electron/Tauri/uni-native/RN = QUIC+WS 竞速 + SQLite。具体「done」:
1. `webProductionBridge` + `idbWasmStorageHost` 物理位于 `typescript-sdk/src/adapters/web`,vue-im-ui 仅消费。
2. SDK 包导出 `TransportProfile` 单一权威;UI 据剖面显隐 QUIC/竞速,降级时自动 `websocket_only`。
3. 新增 `adapters/electron`:`ElectronNativeBridge`(渲染端 IPC ↔ 主进程 koffi 原生 core),`createElectronClient()`。
4. Electron 示例:`electron/main.ts` koffi 加载 cdylib + IPC handler;`preload.ts` 暴露 `flareNative`;`src/main.ts` 注册 factory;cdylib 入 `extraResources`;原生失败回退 WASM。
5. uni-app 示例:核实原生插件链路、补 README、确认 H5 = WS+IndexedDB。
6. 验证:契约版本校验、`verify:architecture`、各端 typecheck/test、Electron 两条用例(QUIC 竞速 + 原生失败回退)。

## Constraints & decisions
- 竞速算法与 SQLite 引擎归 **Rust core**;TS 只传 `SdkConfig`(transportPolicy/protocolRaceOrder/defaultTransport/tlsCaCertPath)。不要在 TS 重写竞速。
- **无兼容冗余**:下沉时删除 vue-im-ui 旧文件,改 import 指向 SDK;不留双份。
- 契约传播顺序:core→bindings→sdk-spec→packages;不手改 generated 文件。**已核实**:TS adapter 由 `flare-im-core-sdk/xtask/src/codegen/bridge.rs` 用 `include_str!` 把 `xtask/templates/bridge/typescript/adapters/*` **静态拷贝**到输出,带 `--check` 漂移守卫。→ electron 的 generated 文件(`flareCoreSdk.ts`、`electronNativeBridge.ts`、`index.ts`)须**加模板 + 注册 BridgeTarget + 跑 `cargo xtask`**,不可手写。
- **已核实**:`clean_bridge_outputs` 只删 `src/bridge` 与指定路径,**不删整个 `src/adapters`**;`src/adapters/<runtime>` 是 generated(`flareCoreSdk.ts`)+ 手写(`webFlareImClient.ts`/`webHostBridge.ts`/`media`/`testing`)**混合**目录 → 手写桥(ElectronNativeBridge 逻辑、下沉的 web 桥)可安全放入,只要 generated 文件保持生成器拥有。
- **跨仓库**:本任务涉及 `flare-im-core-sdk`(Rust xtask 模板 + codegen)与 `flare-im-core-client-sdk`(packages + examples)两仓库。
- Electron 原生加载 = **koffi** load cdylib(已确认 `bindings/c` crate-type 含 cdylib + 头文件 `target/flare_im_core_sdk_ffi.h`)。cdylib 按需 `cargo build`,走 electron-builder `extraResources`。
- 多窗口:主进程单一 core/SQLite,事件扇出所有 webContents,invoke 汇聚单 core。
- Electron 桥须在主进程做一次 `diagnostics.ffi_contract_version` 校验(对标 FfiNativeBridge)。
- 热路径:发送→回显<16ms;大媒体不经控制 IPC;WASM `invokeChain` 串行化保留(wasm32 block_on 不可重入)。
- 降级诚实:原生失败→渲染回退 WebProductionBridge + 剖面降 `websocket_only`,UI 不提供 QUIC。

## Status: 方向调整 — Electron 不用 napi-rs,直接用 ts-sdk;桌面端 WS+SQLite(wa-sqlite/OPFS),web 端 WS+IndexedDB
Current focus: 移除 ts-sdk electron adapter(决策:避免死代码)→ 存储后端可注入 + wa-sqlite/OPFS host + 按构建目标选择。

### 方向调整依据(已实地核实)
- flare-core QUIC = **裸 quinn**(非 WebTransport/HTTP3);WASM build 把 quinn `#[cfg(not(wasm32))]` 编译掉,WASM 端只有 `web_sys::WebSocket`;**传输无 host 注入口**(只有 `setStorageHost`/`setEventCallback`)。
- ⇒ Electron 渲染进程(WASM)**物理拿不到 QUIC**;裸 QUIC 必须跑原生 Rust core(napi/FFI/sidecar)。排除 napi-rs + 直接用 ts-sdk ⇒ **Electron 无 QUIC**。QUIC+SQLite 桌面端走 **Tauri**。
- 存储可注入 ⇒ Electron 桌面端用 **wa-sqlite+OPFS** 真 SQLite(零原生模块);web 端保持 IndexedDB。
- napi-rs 方案(native/ 插件 + app 原生接线)**已全部撤除**,app 回退为直接用 ts-sdk WASM 客户端。

### 新步骤(全部完成并验证)
- [x] **R1**: 移除 ts-sdk electron adapter — 删 xtask 模板 + bridge.rs 注册 + 删 generated `adapters/electron` + `cargo xtask bridge`(无漂移)+ 去 `./electron` 导出。
- [x] **R2**: `WebProductionBridge` 加 `createStorageHost?`(默认 IndexedDB)。
- [x] **R3**: `sqliteOpfsStorageHost.ts` + `sqliteOpfsWorker.ts`(wa-sqlite+OPFS,4 KV 表镜像 IndexedDB 键策略 + storage-changed 事件)+ `wa-sqlite.d.ts` 类型 shim。
- [x] **R4**: `configureProductionStorageBackend('indexeddb'|'sqlite')` + createProductionAppClient 选 host;app/index.ts 导出。
- [x] **R5**: electron `src/main.ts` 据 `flareDesktop.runtime==='electron'` 选 sqlite/indexeddb。
- [x] **R6**: README(electron 传输/存储节重写)+ 设计 §10 + wa-sqlite optionalDependency。
- 验证:SDK `tsc` / vue-im-ui `vue-tsc` / electron renderer+main typecheck 全绿;smoke 94/94;web adapter 21/21;electron node 3/3;`bridge-check` 无漂移。
- 注:wa-sqlite/OPFS 路径需装 `wa-sqlite` + Vite worker/asset 配置 + 打包 Electron 运行认证(本环境只能 typecheck)。

### 进度快照
- ✅ Step 1 核实:adapter 经 xtask `bridge` 子命令生成(模板静态拷贝);`cargo xtask codegen` 因**预存** core 漂移(`message.search_in_conversation`,与本任务无关)bail,改用 `cargo xtask bridge` 单跑 bridge emit。
- ✅ Step 4:electron adapter 落地——模板 3 文件 + bridge.rs 注册 + `cargo xtask bridge` 生成 + package.json `./electron` export;typescript-sdk `tsc` 干净;`bridge-check` 无漂移。
- ✅ Step 5(可验证部分):Electron 示例端到端接线 + 诚实回退,全部 typecheck 通过(electron main `tsc` + renderer `vue-tsc` 均绿)。
  - `electron/nativeCore.ts`:主进程原生 core 边界,`loadNativeCore()` 缺 binding 即返回 null→回退。
  - `electron/main.ts`:单一 core 共享多窗口、事件扇出 `webContents.send`、`flare:native-invoke` handler、`flare:native-available` 同步查询、退出 dispose。
  - `electron/preload.ts`:仅当 native 可用才 `exposeInMainWorld('flareNative', {available,invoke,onEvent})`。
  - `src/main.ts`:`nativeAvailable` 时注册 electron factory + 启用传输选择器;否则默认 WASM 路径、不暴露 QUIC。→ 直接消除"宣称 QUIC 却给不出"。
- ⏸ **决策点(新证据)**:真实 C ABI 用**结构体按值传参 + 结构体接收回调**(`FlareString{ptr,len}` 按值、`FlareEventCallback(ctx,i32,FlareString)`),提交头文件陈旧。这使 koffi 需手写脆弱结构体布局;**N-API(napi-rs,Rust 侧结构体编组 + ThreadSafeFunction)对此 ABI 更安全**。koffi 文档已确认其跨线程回调"排队到主线程"机制可行但要求主线程不阻塞(所有 core 调用须走 `.async`)。→ 需用户复核 koffi vs N-API。
- 原生 binding 模块(`@flare-im/electron-native-core`)= 唯一未完成件:需先 `cargo build` cdylib + 真实 GUI 运行认证,本环境无法构建/运行 native+GUI。

## Steps
- [x] 设计报告定稿 — docs/design/transport-storage-multiruntime.md
- [x] 核实桌面 cdylib 可用性 — bindings/c crate-type=["cdylib","staticlib"],头文件已生成,koffi 可行
- [ ] **Step 1: 核实 generated 边界 & 接线参考**
  - [ ] 查 `scripts`/生成器:`adapters/*/flareCoreSdk.ts`、`bridge/*` 由哪个生成器产出;electron adapter 能否手写(非 generated)或须改生成器
  - [ ] 读 `TauriNativeBridge`(attachEventEmitter/事件通道)作为 ElectronNativeBridge 蓝本
  - [ ] 读 `bindings/c` 头文件导出符号(flare_sdk_*, flare_sdk_invoke_json, 事件回调注册)→ koffi 绑定面
  - [ ] 读 `webFlareImClient.ts` / `webHostBridge.ts` 与 vue-im-ui 下沉目标的接口差异
- [ ] Step 2: 下沉 web 桥 → `adapters/web`
  - [ ] 移动 `webProductionBridge.ts` + `idbWasmStorageHost.ts`(+ wasmLoader 依赖)到 `typescript-sdk/src/adapters/web`
  - [ ] SDK `adapters/web/index.ts` 导出 `createWebClient()`(整合 bridge+host+events)
  - [ ] vue-im-ui `createProductionAppClient` 改为消费 SDK 导出;删旧文件;改所有 import
  - [ ] typecheck web + vue-im-ui
- [ ] Step 3: 落地 `TransportProfile`(`adapters/_shared`)
  - [ ] 定义 `TransportProfile` 类型 + 每 runtime 常量
  - [ ] 把 `buildLoginTransportConfig`/transport 映射从 `useFlareCoreClient` 抽到 `_shared`,UI 改消费
  - [ ] UI(FlareLoginScreen)据 profile 显隐 QUIC;降级钩子置 `websocket_only`
- [ ] Step 4: 新增 `adapters/electron`
  - [ ] `ElectronNativeBridge`(implements NativeBridge):invoke→`ipcRenderer.invoke('flare:native')`;事件←`ipcRenderer.on('flare:native-event')`→DefaultEventsApi
  - [ ] `createElectronClient()` + `index.ts` 导出;profile = native QUIC+WS+SQLite
- [x] Step 5(接线 + 回退,已验证)— main.ts/preload.ts/src/main.ts/nativeCore.ts;electron `tsc` + renderer `vue-tsc` 均绿;electron node test 3/3
  - [ ] (决策门)native binding 实现:koffi vs **N-API**(新 ABI 证据见上)→ 待用户复核
  - [ ] 打包:cargo build cdylib 脚本 + electron-builder `extraResources` + binding 依赖(随实现选择落地)
- [x] Step 6: uni-app 已核实——`isUniNativeTransportRuntime` + FFI/WASM 自动分流已正确;补 README 传输矩阵
- [x] Step 7(本批可验证项)
  - [x] typecheck:typescript-sdk(`tsc`)/ electron renderer(`vue-tsc`)/ electron main(`tsc -p tsconfig.electron`)全绿
  - [x] vitest:`src/adapters/web` 21/21;electron node test 3/3
  - [x] `bridge-check` 无漂移
  - [ ] `verify:architecture` 的 design-tokens 步骤失败 = **预存**问题(`vue-im-ui/src/theme/generated` 目录缺失,与本任务无关,不修)
  - [ ] Electron 端到端用例(QUIC 竞速 / 原生失败回退)需真实 cdylib 构建 + GUI 运行,本环境无法执行

## 本轮新增(已完成并验证)
- ✅ **Step 2(结构下沉)**:`webProductionBridge`+`idbWasmStorageHost` 从 UI 包下沉到
  `typescript-sdk/src/adapters/web`(注入式 `loadRuntime`,Vite 专属的 `wasmLoader` 留 UI 注入);
  vue-im-ui `createProductionAppClient` 改消费 `flare-core-typescript-sdk/web`;删旧文件、改 smoke.test 导入。
  验证:SDK `tsc` + vue-im-ui `vue-tsc` 干净、smoke **94/94**、web adapter vitest 21/21。
- ✅ **Step 3(TransportProfile)**:SDK 新增 `adapters/_shared/transportProfile.ts`(单一能力权威:
  per-runtime transports/storage/native)+ package.json `./transport` 导出;vue-im-ui `appTransportSelector`
  加 `appTransportSelectorProfile()`;`FlareLoginScreen` 改为 `enabled(可用性门控) && profileSupportsQuic(能力权威)`
  驱动——真实消费,非 ceremony。验证:两包 typecheck 干净、smoke 94/94、electron 渲染端 `vue-tsc` ok、bridge 无漂移。

## 仅剩(决策已定 = N-API,需真实构建环境)
- Electron native binding 模块(`@flare-im/electron-native-core`,napi-rs):链 staticlib、Rust 侧结构体编组、
  `ThreadSafeFunction` 推事件;+ cargo build cdylib/addon 脚本 + electron-builder 打包。需 cdylib 构建 + GUI 运行认证,本环境无法执行。
- (无关)`verify:architecture` 的 design-tokens 步骤预存失败(`vue-im-ui/src/theme/generated` 缺失),不在范围。

## Notes / open questions
- 关键文件:
  - 下沉源:`packages/flare-core-vue-im-ui/src/app/infrastructure/sdk/{webProductionBridge,idbWasmStorageHost,wasmLoader,createProductionAppClient}.ts`
  - SDK 目标:`packages/flare-core-typescript-sdk/src/adapters/web/`
  - 蓝本:`adapters/tauri/{flareCoreSdk,tauriNativeBridge}.ts`、`bridge/ffiNativeBridge.ts`
  - Electron:`examples/flare-core-electron-app/{electron/main.ts,electron/preload.ts,src/main.ts,package.json}`
  - 传输配置源:`useFlareCoreClient.ts` (~L203 buildLoginTransportConfig)、`appTransportSelector.ts`
- 开放:`adapters/*` 是否生成器产物 → 决定 electron adapter 写法(Step 1 解决)。
- 开放:cdylib 实际 cargo build 命令与产物名(`libflare_im_core_sdk_ffi.dylib`?)→ Step 5 核实。
- 死胡同记录:WASM-in-renderer 与 WebTransport 均给不出真 QUIC+SQLite,已否决。
```
