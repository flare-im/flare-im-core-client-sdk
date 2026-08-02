import { afterEach, beforeEach, describe, expect, it, vi } from "vitest";

import {
  browserMediaCacheStats,
  cacheBrowserMedia,
  clearBrowserMediaCache,
  hasBrowserMedia,
  isBrowserMediaCacheAvailable,
  openBrowserMediaBlobUrl,
  revokeBrowserMediaBlobUrl,
} from "./browserMediaCache";

type StoredEntry = {
  key: string;
  response: Response;
};

class MockCache {
  readonly entries = new Map<string, StoredEntry>();

  async match(key: Request | string): Promise<Response | undefined> {
    const normalized = typeof key === "string" ? key : key.url;
    return this.entries.get(normalized)?.response;
  }

  async put(key: string, response: Response): Promise<void> {
    this.entries.set(key, { key, response });
  }

  async delete(key: string): Promise<boolean> {
    return this.entries.delete(key);
  }

  async keys(): Promise<Request[]> {
    return [...this.entries.keys()].map((url) => new Request(url));
  }
}

describe("browserMediaCache", () => {
  let cache: MockCache;
  const originalCaches = globalThis.caches;
  const originalFetch = globalThis.fetch;
  const originalCreateObjectUrl = URL.createObjectURL;
  const originalRevokeObjectUrl = URL.revokeObjectURL;

  beforeEach(() => {
    cache = new MockCache();
    vi.stubGlobal("caches", {
      open: vi.fn(async () => cache),
      delete: vi.fn(async () => true),
    });
    vi.stubGlobal("fetch", vi.fn(async () => new Response("hello-bytes", { status: 200 })));
    URL.createObjectURL = vi.fn(() => "blob:mock-url") as typeof URL.createObjectURL;
    URL.revokeObjectURL = vi.fn() as typeof URL.revokeObjectURL;
  });

  afterEach(() => {
    globalThis.caches = originalCaches;
    globalThis.fetch = originalFetch;
    URL.createObjectURL = originalCreateObjectUrl;
    URL.revokeObjectURL = originalRevokeObjectUrl;
    vi.restoreAllMocks();
  });

  it("reports cache availability when caches global exists", () => {
    expect(isBrowserMediaCacheAvailable()).toBe(true);
  });

  it("caches remote media into cache-api keyed storage", async () => {
    const ok = await cacheBrowserMedia("file-1", "https://cdn.example/file-1");
    expect(ok).toBe(true);
    expect(globalThis.fetch).toHaveBeenCalledWith("https://cdn.example/file-1", {
      mode: "cors",
      credentials: "omit",
    });
    expect(await hasBrowserMedia("file-1")).toBe(true);
  });

  it("opens blob url for cached media", async () => {
    await cacheBrowserMedia("file-2", "https://cdn.example/file-2");
    await expect(openBrowserMediaBlobUrl("file-2")).resolves.toBe("blob:mock-url");
  });

  it("returns cache stats for stored entries", async () => {
    await cacheBrowserMedia("file-3", "https://cdn.example/file-3");
    const stats = await browserMediaCacheStats();
    expect(stats.entryCount).toBe(1);
    expect(stats.cacheApiAvailable).toBe(true);
    expect(stats.effectiveRoot).toContain("flare-im-media-v1");
  });

  it("clears cache namespace", async () => {
    await cacheBrowserMedia("file-4", "https://cdn.example/file-4");
    await clearBrowserMediaCache();
    expect(globalThis.caches.delete).toHaveBeenCalledWith("flare-im-media-v1");
  });

  it("revokes blob urls only", () => {
    revokeBrowserMediaBlobUrl("blob:mock");
    revokeBrowserMediaBlobUrl("https://example.com/a");
    expect(URL.revokeObjectURL).toHaveBeenCalledTimes(1);
    expect(URL.revokeObjectURL).toHaveBeenCalledWith("blob:mock");
  });
});
