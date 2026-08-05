import fs from "node:fs";
import { promises as fsPromises } from "node:fs";
import path from "node:path";
const wasmBindingPublicPath = "/flare-core-wasm/";
const wasmBindingFiles = /* @__PURE__ */ new Set(["flare_im_core_sdk.js", "flare_im_core_sdk_bg.wasm"]);
const vueImUiAssetPublicPath = "/flare-im-ui-assets/";
const devMediaApiProxyPrefix = "/__flare-media-api";
const devStorageProxyPrefix = "/__flare-storage";
const defaultMediaApiTarget = "http://127.0.0.1:50050";
const defaultStorageProxyTargets = [
  "http://127.0.0.1:29000",
  "http://localhost:29000",
  "http://127.0.0.1:9000",
  "http://localhost:9000"
];
function pickEnv(env, key, fallback) {
  const value = env[key];
  return typeof value === "string" && value.trim() ? value.trim() : fallback;
}
function pickEnvList(env, key, fallback) {
  const value = env[key];
  if (typeof value !== "string" || !value.trim()) return [...fallback];
  return value.split(",").map((item) => item.trim()).filter(Boolean);
}
function createMediaProxyTable(env) {
  const apiPrefix = pickEnv(env, "VITE_MEDIA_API_PROXY_PREFIX", devMediaApiProxyPrefix).replace(/\/$/, "");
  const storagePrefix = pickEnv(env, "VITE_STORAGE_PROXY_PREFIX", devStorageProxyPrefix).replace(/\/$/, "");
  const storageTargets = pickEnvList(env, "VITE_STORAGE_PROXY_TARGETS", defaultStorageProxyTargets);
  return {
    [apiPrefix]: {
      target: pickEnv(env, "VITE_MEDIA_API_PROXY_TARGET", defaultMediaApiTarget),
      changeOrigin: true,
      rewrite: (requestPath) => requestPath.slice(apiPrefix.length) || "/"
    },
    [storagePrefix]: {
      target: storageTargets[0] ?? defaultStorageProxyTargets[0],
      changeOrigin: true,
      rewrite: (requestPath) => requestPath.slice(storagePrefix.length) || "/"
    }
  };
}
function flareWasmBindingAssets(wasmBindingRoot, appDir) {
  return {
    name: "flare-wasm-binding-assets",
    configureServer(server) {
      server.middlewares.use((request, response, next) => {
        const requestPath = request.url?.split("?")[0] ?? "";
        if (!requestPath.startsWith(wasmBindingPublicPath)) {
          next();
          return;
        }
        const fileName = decodeURIComponent(requestPath.slice(wasmBindingPublicPath.length));
        if (!wasmBindingFiles.has(fileName)) {
          response.statusCode = 404;
          response.end("Unknown Flare WASM binding asset");
          return;
        }
        const filePath = path.join(wasmBindingRoot, fileName);
        response.setHeader(
          "Content-Type",
          fileName.endsWith(".wasm") ? "application/wasm" : "text/javascript; charset=utf-8"
        );
        response.setHeader("Cache-Control", "no-cache");
        fs.createReadStream(filePath).on("error", (error) => {
          response.statusCode = error.code === "ENOENT" ? 404 : 500;
          response.end(`Unable to read Flare WASM binding asset ${fileName}: ${error.message}`);
        }).pipe(response);
      });
    },
    async writeBundle(options) {
      const outputDir = options.dir ? path.resolve(options.dir) : path.resolve(appDir, "dist");
      const targetDir = path.join(outputDir, wasmBindingPublicPath.replace(/^\/|\/$/g, ""));
      await fsPromises.mkdir(targetDir, { recursive: true });
      await Promise.all(
        Array.from(
          wasmBindingFiles,
          (fileName) => fsPromises.copyFile(path.join(wasmBindingRoot, fileName), path.join(targetDir, fileName))
        )
      );
    }
  };
}
function contentTypeForAsset(filePath) {
  if (filePath.endsWith(".webp")) return "image/webp";
  if (filePath.endsWith(".json")) return "application/json; charset=utf-8";
  return "application/octet-stream";
}
function resolveSafeAssetPath(root, requestPath) {
  const relativePath = decodeURIComponent(requestPath).replace(/^\/+/, "");
  const resolved = path.resolve(root, relativePath);
  const normalizedRoot = path.resolve(root);
  if (resolved !== normalizedRoot && !resolved.startsWith(`${normalizedRoot}${path.sep}`)) {
    return null;
  }
  return resolved;
}
function flareVueImUiAssets(vueImUiAssetRoot, appDir) {
  return {
    name: "flare-vue-im-ui-assets",
    configureServer(server) {
      server.middlewares.use((request, response, next) => {
        const requestPath = request.url?.split("?")[0] ?? "";
        if (!requestPath.startsWith(vueImUiAssetPublicPath)) {
          next();
          return;
        }
        const assetPath = resolveSafeAssetPath(
          vueImUiAssetRoot,
          requestPath.slice(vueImUiAssetPublicPath.length)
        );
        if (!assetPath) {
          response.statusCode = 400;
          response.end("Invalid Flare UI asset path");
          return;
        }
        response.setHeader("Content-Type", contentTypeForAsset(assetPath));
        response.setHeader("Cache-Control", "public, max-age=31536000, immutable");
        fs.createReadStream(assetPath).on("error", (error) => {
          response.statusCode = error.code === "ENOENT" ? 404 : 500;
          response.end(`Unable to read Flare UI asset: ${error.message}`);
        }).pipe(response);
      });
    },
    async writeBundle(options) {
      const outputDir = options.dir ? path.resolve(options.dir) : path.resolve(appDir, "dist");
      const targetDir = path.join(outputDir, vueImUiAssetPublicPath.replace(/^\/|\/$/g, ""));
      await fsPromises.rm(targetDir, { force: true, recursive: true });
      await fsPromises.cp(vueImUiAssetRoot, targetDir, { recursive: true });
    }
  };
}
function normalizedBuildId(id) {
  return id.replace(/\\/g, "/");
}
function flareVueImUiChunk(id) {
  const normalized = normalizedBuildId(id);
  // 既认包名也认解析后的目录名：本地开发用 file: 依赖 / alias 指向源码目录，
  // Vite 解析出来的 id 是真实路径（.../flare-im-design/vue-im-ui/...），里面
  // 根本没有 "@flare-im/vue-ui" 这一段。只匹配包名的话，这里的所有分包规则
  // 都静默失效，整个 UI 库落进 vendor —— 表现是构建过体积门禁不过，而不是报错。
  if (!normalized.includes("@flare-im/vue-ui") && !normalized.includes("/vue-im-ui/")) {
    return void 0;
  }
  if (normalized.includes("/app/components/FlareSdkLabPanel") || normalized.includes("/app/message-enhancements/")) {
    return "flare-im-sdk-lab";
  }
  if (normalized.includes("/components/message-preview/") || normalized.includes("/app/infrastructure/media/")) {
    return "flare-im-media";
  }
  if (normalized.includes("/components/shell/FlareDiagnosticsConsole")) {
    return "flare-im-diagnostics";
  }
  if (normalized.includes("/components/messages/") || normalized.includes("/components/composer/") || normalized.includes("/app/components/FlareChatWorkspace")) {
    return "flare-im-chat";
  }
  if (normalized.includes("/app/components/") || normalized.includes("/components/shell/")) {
    return "flare-im-shell";
  }
  return void 0;
}
// 未被下面任何显式规则认领的第三方包，按**包名**兜底分组。
//
// 原先它们全部落进 Vite 默认的单个 vendor chunk：规则枚举得再细，只要漏掉一个
// 大包（比如图标库从 @vicons 换到 lucide 之后），vendor 就会重新胀回去，而症状
// 是"体积门禁不过"，指不到是哪个包。按包名分组让新增依赖天然分散，也让超标时
// 一眼看得出是谁。
function fallbackVendorChunk(normalized) {
  const m = normalized.match(/node_modules\/((?:@[^/]+\/)?[^/]+)/);
  return m ? `vendor-${m[1].replace(/[@/]/g, "-")}` : void 0;
}

function nodeModuleChunk(id) {
  const normalized = normalizedBuildId(id);
  if (!normalized.includes("node_modules")) {
    return void 0;
  }
  if (normalized.includes("node_modules/lucide-vue-next")) {
    return "icon-runtime";
  }
  if (normalized.includes("node_modules/protobufjs") || normalized.includes("node_modules/markdown-it")) {
    return "content-runtime";
  }
  if (normalized.includes("node_modules/@vicons")) {
    return "icon-runtime";
  }
  if (normalized.includes("node_modules/vue/") || normalized.includes("node_modules/@vue/") || normalized.includes("node_modules/vue-router")) {
    return "vue-runtime";
  }
  if (normalized.includes("node_modules/@css-render") || normalized.includes("node_modules/css-render") || normalized.includes("node_modules/vooks") || normalized.includes("node_modules/vueuc") || normalized.includes("node_modules/treemate") || normalized.includes("node_modules/seemly") || normalized.includes("node_modules/evtd") || normalized.includes("node_modules/async-validator") || normalized.includes("node_modules/date-fns") || normalized.includes("node_modules/lodash-es")) {
    return "naive-foundation";
  }
  if (normalized.includes("node_modules/naive-ui")) {
    if (normalized.includes("/button") || normalized.includes("/input") || normalized.includes("/input-number") || normalized.includes("/select") || normalized.includes("/switch") || normalized.includes("/tabs") || normalized.includes("/form")) {
      return "naive-controls";
    }
    if (normalized.includes("/modal") || normalized.includes("/drawer") || normalized.includes("/dropdown") || normalized.includes("/dialog") || normalized.includes("/message") || normalized.includes("/popover") || normalized.includes("/tooltip")) {
      return "naive-overlays";
    }
    if (normalized.includes("/alert") || normalized.includes("/collapse") || normalized.includes("/config-provider") || normalized.includes("/divider") || normalized.includes("/icon") || normalized.includes("/list") || normalized.includes("/progress") || normalized.includes("/tag")) {
      return "naive-display";
    }
    if (normalized.includes("/_")) {
      return "naive-foundation";
    }
    return "naive-runtime";
  }
  return "vendor";
  return fallbackVendorChunk(normalized);
}
function createFlareCoreWebAppViteConfig(options) {
  const appDir = options.appDir;
  const repoRoot = path.resolve(appDir, "../../..");
  const wasmBindingRoot = path.resolve(repoRoot, "flare-im-core-sdk/bindings/wasm/pkg");
  const typeScriptSdkRoot = path.resolve(appDir, "../../packages/flare-core-typescript-sdk/src");
  const vueImUiRoot = path.resolve(repoRoot, "flare-im-design/vue-im-ui/src");
  // Emoji/sticker resources are centralized at the flare-im-design top level
  // (single cross-platform source), served here at /flare-im-ui-assets/.
  const vueImUiAssetRoot = path.resolve(repoRoot, "flare-im-design/assets/emoji-sticker");
  return options.defineConfig(({ mode }) => {
    const env = options.loadEnv(mode, appDir, "VITE_");
    return {
      plugins: [
        options.vuePlugin(),
        flareWasmBindingAssets(wasmBindingRoot, appDir),
        flareVueImUiAssets(vueImUiAssetRoot, appDir)
      ],
      define: {
        ...(options.extraDefine ?? {})
      },
      resolve: {
        alias: [
          ...options.extraAliases ?? [],
          {
            find: "@flare-im/sdk/web",
            replacement: path.join(typeScriptSdkRoot, "adapters/web/index.ts")
          },
          {
            find: "@flare-im/sdk/tauri",
            replacement: path.join(typeScriptSdkRoot, "adapters/tauri/index.ts")
          },
          {
            find: "@flare-im/sdk/transport",
            replacement: path.join(typeScriptSdkRoot, "adapters/_shared/transportProfile.ts")
          },
          {
            find: /^@flare-im\/sdk\/(.+)$/,
            replacement: path.join(typeScriptSdkRoot, "$1")
          },
          {
            find: "@flare-im/vue-ui/style.css",
            replacement: path.join(vueImUiRoot, "design-system/styles/index.css")
          },
          {
            find: "@flare-im/vue-ui/theme",
            replacement: path.join(vueImUiRoot, "design-system/theme/index.ts")
          },
          {
            find: "@flare-im/vue-ui/i18n",
            replacement: path.join(vueImUiRoot, "shared/i18n/index.ts")
          },
          {
            find: "@flare-im/vue-ui/components",
            replacement: path.join(vueImUiRoot, "components/index.ts")
          },
          {
            find: "@flare-im/vue-ui/utils",
            replacement: path.join(vueImUiRoot, "utils/index.ts")
          },
          {
            find: "@flare-im/vue-ui/composables",
            replacement: path.join(vueImUiRoot, "composables/index.ts")
          },
          {
            find: "@flare-im/vue-ui/contracts",
            replacement: path.join(vueImUiRoot, "shared/contracts/index.ts")
          },
          {
            find: "@flare-im/vue-ui/sdk-lab",
            replacement: path.join(vueImUiRoot, "app/components/FlareSdkLabPanel.vue")
          },
          {
            find: "@flare-im/vue-ui/app/style.css",
            replacement: path.join(vueImUiRoot, "app/styles/index.css")
          },
          {
            find: /^@flare-im\/vue-ui\/app\/components\/(.+)$/,
            replacement: path.join(vueImUiRoot, "app/components/$1")
          },
          {
            find: "@flare-im/vue-ui/app",
            replacement: path.join(vueImUiRoot, "app/index.ts")
          },
          {
            find: "@flare-im/vue-ui",
            replacement: path.join(vueImUiRoot, "index.ts")
          },
          {
            find: "@flare-im/sdk",
            replacement: path.join(typeScriptSdkRoot, "index.ts")
          }
        ],
        dedupe: ["vue"]
      },
      server: {
        port: options.serverPort,
        strictPort: false,
        fs: {
          allow: [repoRoot]
        },
        proxy: createMediaProxyTable(env)
      },
      build: {
        rollupOptions: {
          output: {
            manualChunks(id) {
              const normalizedId = normalizedBuildId(id);
              const nodeChunk = nodeModuleChunk(normalizedId);
              if (nodeChunk) {
                return nodeChunk;
              }
              const vueImUiChunk = flareVueImUiChunk(normalizedId);
              if (vueImUiChunk) {
                return vueImUiChunk;
              }
              if (normalizedId.includes("/views/SdkLabView")) {
                return "sdk-lab";
              }
              if (
                normalizedId.includes("@flare-im/sdk") ||
                normalizedId.includes("/flare-core-typescript-sdk/") ||
                normalizedId.includes("flare-im-core-sdk/bindings")
              ) {
                return "flare-sdk";
              }
              return void 0;
            }
          }
        }
      }
    };
  });
}
export {
  createFlareCoreWebAppViteConfig
};
