/**
 * Browser "save to device": the user's chosen folder (File System Access API, where the browser
 * has it) or the browser's own download flow.
 *
 * A folder the user picked is remembered as a directory handle in IndexedDB. Writing to it needs
 * the user's permission again in a later session; when the browser does not grant it, the file
 * goes through the browser's download flow instead and the result says so (`savedVia`).
 */

const DB_NAME = 'flare-im-media';
const STORE = 'settings';
const DIRECTORY_KEY = 'downloadDirectory';

/** Minimal File System Access API surface (not in every TS DOM lib yet). */
interface WritableFileStream {
  write(data: Blob): Promise<void>;
  close(): Promise<void>;
  abort?(): Promise<void>;
}
interface FileHandleLike {
  createWritable(): Promise<WritableFileStream>;
}
export interface DirectoryHandleLike {
  readonly kind: 'directory';
  readonly name: string;
  getFileHandle(name: string, options?: { create?: boolean }): Promise<FileHandleLike>;
  queryPermission?(descriptor: { mode: 'readwrite' }): Promise<PermissionState>;
  requestPermission?(descriptor: { mode: 'readwrite' }): Promise<PermissionState>;
}
type ShowDirectoryPicker = (options?: {
  id?: string;
  mode?: 'read' | 'readwrite';
  startIn?: string;
}) => Promise<DirectoryHandleLike>;

function directoryPicker(): ShowDirectoryPicker | undefined {
  const picker = (globalThis as { showDirectoryPicker?: ShowDirectoryPicker }).showDirectoryPicker;
  return typeof picker === 'function' ? picker : undefined;
}

/** Whether this browser lets the user pick a download folder. */
export function supportsDownloadDirectoryPicker(): boolean {
  return directoryPicker() !== undefined && typeof indexedDB !== 'undefined';
}

function openSettingsDb(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(DB_NAME, 1);
    request.onupgradeneeded = () => {
      if (!request.result.objectStoreNames.contains(STORE)) {
        request.result.createObjectStore(STORE);
      }
    };
    request.onsuccess = () => resolve(request.result);
    request.onerror = () => reject(request.error ?? new Error('indexedDB open failed'));
  });
}

async function settingsTx<T>(
  mode: IDBTransactionMode,
  run: (store: IDBObjectStore) => IDBRequest<T>,
): Promise<T> {
  const db = await openSettingsDb();
  try {
    return await new Promise<T>((resolve, reject) => {
      const tx = db.transaction(STORE, mode);
      const request = run(tx.objectStore(STORE));
      tx.oncomplete = () => resolve(request.result);
      tx.onerror = () => reject(tx.error ?? new Error('indexedDB transaction failed'));
      tx.onabort = () => reject(tx.error ?? new Error('indexedDB transaction aborted'));
    });
  } finally {
    db.close();
  }
}

/** The folder the user picked earlier, if any. */
export async function storedDownloadDirectory(): Promise<DirectoryHandleLike | undefined> {
  if (typeof indexedDB === 'undefined') return undefined;
  try {
    const handle = await settingsTx('readonly', (store) => store.get(DIRECTORY_KEY));
    return handle && (handle as DirectoryHandleLike).kind === 'directory'
      ? (handle as DirectoryHandleLike)
      : undefined;
  } catch {
    return undefined;
  }
}

/** Asks the user for a folder. Must run inside a user gesture (a click). */
export async function pickDownloadDirectory(): Promise<DirectoryHandleLike> {
  const picker = directoryPicker();
  if (!picker) {
    throw new Error('this browser cannot pick a download folder');
  }
  const handle = await picker({ id: 'flare-downloads', mode: 'readwrite', startIn: 'downloads' });
  await settingsTx('readwrite', (store) => store.put(handle, DIRECTORY_KEY));
  return handle;
}

export async function forgetDownloadDirectory(): Promise<void> {
  if (typeof indexedDB === 'undefined') return;
  await settingsTx('readwrite', (store) => store.delete(DIRECTORY_KEY));
}

/** Write access to [handle]: granted already, or asked for (needs a user gesture), else none. */
async function ensureWritable(handle: DirectoryHandleLike): Promise<boolean> {
  try {
    const descriptor = { mode: 'readwrite' as const };
    if ((await handle.queryPermission?.(descriptor)) === 'granted') return true;
    return (await handle.requestPermission?.(descriptor)) === 'granted';
  } catch {
    return false;
  }
}

function splitName(fileName: string): [string, string] {
  const dot = fileName.lastIndexOf('.');
  return dot > 0 ? [fileName.slice(0, dot), fileName.slice(dot)] : [fileName, ''];
}

async function fileExists(dir: DirectoryHandleLike, name: string): Promise<boolean> {
  try {
    await dir.getFileHandle(name);
    return true;
  } catch {
    return false;
  }
}

/** `name.ext`, else `name (1).ext`, `name (2).ext`, … — the same naming the native core uses. */
export async function uniqueDownloadName(dir: DirectoryHandleLike, fileName: string): Promise<string> {
  if (!(await fileExists(dir, fileName))) return fileName;
  const [stem, ext] = splitName(fileName);
  for (let i = 1; i < 10_000; i += 1) {
    const candidate = `${stem} (${i})${ext}`;
    if (!(await fileExists(dir, candidate))) return candidate;
  }
  return `${stem}_${Date.now()}${ext}`;
}

/** Characters no file system accepts, and path separators, become `_`. */
export function sanitizeDownloadFileName(raw: string): string {
  const base = raw.trim().split(/[\\/]/).filter(Boolean).pop() ?? '';
  const cleaned = Array.from(base)
    .map((ch) => (ch.charCodeAt(0) < 0x20 || '?%*:|"<>'.includes(ch) ? '_' : ch))
    .join('')
    .slice(0, 200)
    .replace(/^[ .]+|[ .]+$/g, '');
  return cleaned || 'download';
}

export interface SavedToFolder {
  directory: string;
  fileName: string;
}

/** Writes [blob] into the picked folder; `undefined` when there is no folder or no permission. */
export async function saveBlobToPickedDirectory(
  blob: Blob,
  fileName: string,
): Promise<SavedToFolder | undefined> {
  const dir = await storedDownloadDirectory();
  if (!dir || !(await ensureWritable(dir))) return undefined;
  const name = await uniqueDownloadName(dir, sanitizeDownloadFileName(fileName));
  const file = await dir.getFileHandle(name, { create: true });
  const writable = await file.createWritable();
  try {
    await writable.write(blob);
    await writable.close();
  } catch (error) {
    await writable.abort?.().catch(() => undefined);
    throw error;
  }
  return { directory: dir.name, fileName: name };
}

/** Hands [blob] (or a URL) to the browser's download flow under [fileName]. */
export function saveThroughBrowser(source: Blob | string, fileName: string): void {
  if (typeof document === 'undefined') {
    throw new Error('no document to start a browser download');
  }
  const href = typeof source === 'string' ? source : URL.createObjectURL(source);
  const anchor = document.createElement('a');
  anchor.href = href;
  anchor.download = sanitizeDownloadFileName(fileName);
  anchor.rel = 'noopener';
  anchor.style.display = 'none';
  document.body.appendChild(anchor);
  anchor.click();
  anchor.remove();
  if (typeof source !== 'string') {
    // The browser reads the blob asynchronously after the click.
    setTimeout(() => URL.revokeObjectURL(href), 60_000);
  }
}

/** Fetches [url] as a blob, reporting progress and honouring [signal]. */
export async function fetchBlob(
  url: string,
  signal: AbortSignal,
  onProgress?: (downloaded: number, total: number | undefined) => void,
): Promise<Blob> {
  const response = await fetch(url, { mode: 'cors', credentials: 'omit', signal });
  if (!response.ok) {
    throw new Error(`download failed: HTTP ${response.status}`);
  }
  const lengthHeader = Number(response.headers.get('content-length'));
  const total = Number.isFinite(lengthHeader) && lengthHeader > 0 ? lengthHeader : undefined;
  const type = response.headers.get('content-type') ?? '';
  if (!response.body || !onProgress) {
    const blob = await response.blob();
    onProgress?.(blob.size, total ?? blob.size);
    return blob;
  }
  const reader = response.body.getReader();
  const chunks: BlobPart[] = [];
  let downloaded = 0;
  onProgress(0, total);
  for (;;) {
    const { done, value } = await reader.read();
    if (done) break;
    chunks.push(value);
    downloaded += value.byteLength;
    onProgress(downloaded, total);
  }
  return new Blob(chunks, { type });
}
