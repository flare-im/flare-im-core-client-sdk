export type FlareCoreWebAppViteOptions = {
  appDir: string;
  serverPort: number;
  defineConfig: (config: (context: { mode: string }) => Record<string, unknown>) => unknown;
  loadEnv: (mode: string, envDir: string, prefixes: string) => Record<string, string>;
  vuePlugin: () => unknown;
  extraAliases?: unknown[];
  extraDefine?: Record<string, unknown>;
};

export declare function createFlareCoreWebAppViteConfig(options: FlareCoreWebAppViteOptions): unknown;
