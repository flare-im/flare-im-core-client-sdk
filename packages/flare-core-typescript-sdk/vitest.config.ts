import path from "node:path";
import { fileURLToPath } from "node:url";

import { defineConfig } from "vitest/config";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const workspaceRoot = path.resolve(__dirname, "../../../..");

export default defineConfig({
  resolve: {
    alias: {
      "flare-core-typescript-sdk/web": path.resolve(__dirname, "src/adapters/web/index.ts"),
      "flare-core-typescript-sdk/tauri": path.resolve(__dirname, "src/adapters/tauri/index.ts"),
      "flare-core-typescript-sdk": path.resolve(__dirname, "src/index.ts"),
    },
  },
  server: {
    fs: {
      allow: [workspaceRoot],
    },
  },
  test: {
    environment: "node",
    include: ["src/**/*.test.ts", "test/**/*.test.ts"],
    testTimeout: 60_000,
  },
});
