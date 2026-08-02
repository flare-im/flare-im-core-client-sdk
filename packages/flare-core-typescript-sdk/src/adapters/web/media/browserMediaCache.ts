const CACHE_NAME = 'flare-im-media-v1';
const KEY_PREFIX = 'https://flare-im.local/media/';

function cacheKey(fileId: string): string {
  return `${KEY_PREFIX}${encodeURIComponent(fileId.trim())}`;
}

export function isBrowserMediaCacheAvailable(): boolean {
  return typeof globalThis.caches !== 'undefined';
}

export async function cacheBrowserMedia(fileId: string, url: string): Promise<boolean> {
  const fid = fileId.trim();
  const target = url.trim();
  if (!fid || !target || !isBrowserMediaCacheAvailable()) {
    return false;
  }
  const cache = await caches.open(CACHE_NAME);
  const response = await fetch(target, { mode: 'cors', credentials: 'omit' });
  if (!response.ok) {
    throw new Error(`cache remote media failed: HTTP ${response.status}`);
  }
  await cache.put(cacheKey(fid), response.clone());
  return true;
}

export async function hasBrowserMedia(fileId: string): Promise<boolean> {
  const fid = fileId.trim();
  if (!fid || !isBrowserMediaCacheAvailable()) {
    return false;
  }
  const cache = await caches.open(CACHE_NAME);
  const hit = await cache.match(cacheKey(fid));
  return hit !== undefined;
}

export async function openBrowserMediaBlobUrl(fileId: string): Promise<string | undefined> {
  const fid = fileId.trim();
  if (!fid || !isBrowserMediaCacheAvailable()) {
    return undefined;
  }
  const cache = await caches.open(CACHE_NAME);
  const hit = await cache.match(cacheKey(fid));
  if (!hit) {
    return undefined;
  }
  const blob = await hit.blob();
  return URL.createObjectURL(blob);
}

export function revokeBrowserMediaBlobUrl(blobUrl: string): void {
  if (blobUrl.startsWith('blob:')) {
    URL.revokeObjectURL(blobUrl);
  }
}

export async function deleteBrowserMedia(fileId: string): Promise<void> {
  const fid = fileId.trim();
  if (!fid || !isBrowserMediaCacheAvailable()) {
    return;
  }
  const cache = await caches.open(CACHE_NAME);
  await cache.delete(cacheKey(fid));
}

export async function clearBrowserMediaCache(): Promise<void> {
  if (!isBrowserMediaCacheAvailable()) {
    return;
  }
  await caches.delete(CACHE_NAME);
}

export async function browserMediaCacheStats(): Promise<{
  effectiveRoot: string;
  defaultRoot: string;
  maxBytes: number;
  totalBytes: number;
  entryCount: number;
  cacheApiAvailable: boolean;
}> {
  if (!isBrowserMediaCacheAvailable()) {
    return {
      effectiveRoot: 'browser-http-cache',
      defaultRoot: 'browser-http-cache',
      maxBytes: 0,
      totalBytes: 0,
      entryCount: 0,
      cacheApiAvailable: false,
    };
  }
  const cache = await caches.open(CACHE_NAME);
  const keys = await cache.keys();
  const mediaKeys = keys.filter((request) => request.url.startsWith(KEY_PREFIX));
  let totalBytes = 0;
  for (const request of mediaKeys) {
    const response = await cache.match(request);
    if (!response) continue;
    const blob = await response.blob();
    totalBytes += blob.size;
  }
  return {
    effectiveRoot: `cache-api://${CACHE_NAME}`,
    defaultRoot: `cache-api://${CACHE_NAME}`,
    maxBytes: 0,
    totalBytes,
    entryCount: mediaKeys.length,
    cacheApiAvailable: true,
  };
}
