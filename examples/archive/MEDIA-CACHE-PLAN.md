# 媒体本地缓存与加载对齐主流 IM（Android + iOS）

## Goal
两端消息媒体(图/视频/音频)经 **SDK 托管磁盘缓存**加载，达到主流 IM 媒体管理：
- 远端媒体 → `media.cacheRemoteMedia(fileId)` → 返回去重的本地缓存路径(`localPath`)，从磁盘加载(离线可用、不重复下载)。
- 启动时配置缓存：`setMediaCacheRoot(<app cache dir>)` + `setMediaCacheMaxBytes(256MB)`。
- 内存解码缓存(Android LruCache)避免逐帧重解码。
- 设置页缓存管理：用量(`getMediaCacheStats`) / 上限(`setMediaCacheMaxBytes`) / 清空(`clearMediaCache`)。

## 关键事实(已扫描)
- SDK/core 已实现完整媒体缓存子系统(`domain/media_cache.rs` LRU + dedup)。`cacheRemoteMedia` 先 `get_cached`(命中即返回)否则下载 `put_bytes`。
- `MediaCacheEntryVo` 返回 key：`localPath`(缓存文件路径)、`fileId`、`mimeType`、`sizeBytes`、`updatedAtMs`。
- 之前两端只在 SdkLab 探针里调缓存方法；消息显示走 `resolveMediaAccess`→URL 后各自临时下载(iOS AsyncImage/URLCache、Android 手动下载)——**未走 SDK 缓存**。
- `setMediaCacheRoot(["root": path])`、`setMediaCacheMaxBytes(["maxBytes": Long])`、`clearMediaCache()`、`getMediaCacheStats()`。

## Status: DONE — 两端 P1-P4 完成，Android make build+test green，iOS xcodebuild SUCCEEDED

## Steps
- [x] **P1 启动配置缓存(两端)** — AppSession 登录后 `setMediaCacheRoot` + `setMediaCacheMaxBytes(256MB)`。
- [x] P2 显示走 SDK 缓存(两端) — resolveMediaUrl / resolveMediaDisplayURL：有 fileId 先 `cacheRemoteMedia`→localPath，回退 resolveMediaAccess URL，回退直链。
- [x] P3 Android 内存解码 LruCache(FlareLocalImage) — key=path+maxPx。
- [x] P4 设置页缓存管理(两端) — stats/maxBytes/clear。
- [x] 验证 — Android make build+test；iOS xcodebuild。

## Notes
- 缓存根：Android `filesDir/media-cache`；iOS `cachesDirectory/flare-media`。
- 真跨端下载仍需媒体后端(flare-med)；无后端时 cacheRemoteMedia 拿不到下载 URL→回退本地直链(发送方自看)。调用链已就绪。
