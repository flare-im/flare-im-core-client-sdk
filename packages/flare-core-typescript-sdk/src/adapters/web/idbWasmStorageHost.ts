const DB_NAME = "flare-core-web-app";
const DB_VERSION = 6;
const WASM_MESSAGES = "wasmMessages";
const WASM_CONVERSATIONS = "wasmConversations";
const WASM_CURSORS = "wasmCursors";
const WASM_PENDING_SENDS = "wasmPendingSends";

export const WASM_STORAGE_CHANGED_EVENT = "flare:wasm-storage-changed";

export type WasmStorageChangedDetail = {
  userId: string;
  kind: "message" | "conversation" | "cursor" | "pending_send" | "delete";
  conversationId?: string;
  id?: string;
  message?: Record<string, unknown>;
  conversation?: Record<string, unknown>;
};

type PersistMessagePayload = {
  userId: string;
  message: Record<string, unknown>;
};

type PersistConversationPayload = {
  userId: string;
  conversation: Record<string, unknown>;
};

type PersistCursorPayload = {
  userId: string;
  key: string;
  value: string;
};

type PersistPendingSendPayload = {
  userId: string;
  entry: Record<string, unknown>;
};

type DeletePayload = {
  userId: string;
  id: string;
};

function userPrefix(userId: string): string {
  return userId.trim();
}

function messageKey(userId: string, message: Record<string, unknown>): string {
  const serverId = String(message.serverId ?? "");
  const clientMsgId = String(message.clientMsgId ?? "");
  const conversationId = String(message.conversationId ?? "");
  const seq = String(message.conversationSeq ?? 0).padStart(20, "0");
  return `${userPrefix(userId)}::${conversationId}::${seq}::${serverId || clientMsgId || cryptoSafeId()}`;
}

function pendingSendKey(userId: string, entry: Record<string, unknown>): string {
  const clientMsgId = String(entry.clientMsgId ?? cryptoSafeId());
  return `${userPrefix(userId)}::${clientMsgId}`;
}

function messageConversationId(message: Record<string, unknown>): string {
  return String(message.conversationId ?? "").trim();
}

function conversationIdFromConversation(conversation: Record<string, unknown>): string {
  return String(conversation.conversationId ?? "").trim();
}

/**
 * Cached connection — every save/load/delete reuses one `IDBDatabase` instead of
 * reopening per operation (a snapshot load alone opened 4 connections, each message
 * save 1 more). The cache is cleared if the connection closes or another tab triggers
 * a version change, so the next call transparently reopens.
 */
let dbPromise: Promise<IDBDatabase> | null = null;

function openDbConnection(): Promise<IDBDatabase> {
  return new Promise((resolve, reject) => {
    const request = indexedDB.open(DB_NAME, DB_VERSION);
    request.onerror = () => reject(request.error);
    request.onupgradeneeded = () => {
      const db = request.result;
      for (const storeName of [WASM_MESSAGES, WASM_CONVERSATIONS, WASM_CURSORS, WASM_PENDING_SENDS]) {
        if (db.objectStoreNames.contains(storeName)) {
          db.deleteObjectStore(storeName);
        }
      }
      if (!db.objectStoreNames.contains(WASM_MESSAGES)) {
        const store = db.createObjectStore(WASM_MESSAGES, { keyPath: "key" });
        store.createIndex("userId", "userId", { unique: false });
      }
      if (!db.objectStoreNames.contains(WASM_CONVERSATIONS)) {
        const store = db.createObjectStore(WASM_CONVERSATIONS, { keyPath: "key" });
        store.createIndex("userId", "userId", { unique: false });
      }
      if (!db.objectStoreNames.contains(WASM_CURSORS)) {
        const store = db.createObjectStore(WASM_CURSORS, { keyPath: "key" });
        store.createIndex("userId", "userId", { unique: false });
      }
      if (!db.objectStoreNames.contains(WASM_PENDING_SENDS)) {
        const store = db.createObjectStore(WASM_PENDING_SENDS, { keyPath: "key" });
        store.createIndex("userId", "userId", { unique: false });
      }
    };
    request.onsuccess = () => resolve(request.result);
  });
}

function openDb(): Promise<IDBDatabase> {
  if (!dbPromise) {
    dbPromise = openDbConnection().then((db) => {
      // Drop the cached handle when it goes away so the next call reopens cleanly.
      db.onclose = () => {
        dbPromise = null;
      };
      db.onversionchange = () => {
        db.close();
        dbPromise = null;
      };
      return db;
    });
    // A failed open must not poison the cache.
    dbPromise.catch(() => {
      dbPromise = null;
    });
  }
  return dbPromise;
}

function requestToPromise<T>(request: IDBRequest<T>): Promise<T> {
  return new Promise((resolve, reject) => {
    request.onerror = () => reject(request.error);
    request.onsuccess = () => resolve(request.result);
  });
}

function isRecord(value: unknown): value is Record<string, unknown> {
  return Boolean(value) && typeof value === "object" && !Array.isArray(value);
}

function hasCanonicalOptionalBooleans(record: Record<string, unknown>, keys: readonly string[]): boolean {
  return keys.every((key) => record[key] === undefined || typeof record[key] === "boolean");
}

function hasCanonicalOptionalUnsigned(record: Record<string, unknown>, keys: readonly string[]): boolean {
  return keys.every((key) => {
    const value = record[key];
    return value === undefined || (typeof value === "number" && Number.isInteger(value) && value >= 0);
  });
}

function isCanonicalStoredMessage(message: unknown): message is Record<string, unknown> {
  if (!isRecord(message)) return false;
  if (!hasCanonicalOptionalBooleans(message, ["isRead", "isRecalled", "isEdited", "mentionAll"])) {
    return false;
  }
  const localState = message.localState;
  if (localState === undefined || localState === null) return true;
  if (!isRecord(localState)) return false;
  return hasCanonicalOptionalBooleans(localState, ["sending", "failed", "isLocal", "uploading"])
    && hasCanonicalOptionalUnsigned(localState, ["uploadProgress", "sortTs"]);
}

function isCanonicalStoredConversation(conversation: unknown): conversation is Record<string, unknown> {
  if (!isRecord(conversation)) return false;
  return hasCanonicalOptionalBooleans(conversation, [
    "isPinned",
    "isMuted",
    "isArchived",
    "mentionMe",
  ]);
}

async function deleteRowsByKeys(storeName: string, keys: readonly string[]): Promise<void> {
  if (!keys.length) return;
  const db = await openDb();
  await new Promise<void>((resolve, reject) => {
    const tx = db.transaction(storeName, "readwrite");
    tx.onerror = () => reject(tx.error);
    tx.oncomplete = () => resolve();
    const store = tx.objectStore(storeName);
    for (const key of keys) {
      store.delete(key);
    }
  });
}

async function getAllForUser<T extends { userId: string }>(
  storeName: string,
  userId: string,
): Promise<T[]> {
  const db = await openDb();
  const tx = db.transaction(storeName, "readonly");
  const index = tx.objectStore(storeName).index("userId");
  return requestToPromise(index.getAll(userPrefix(userId)));
}

async function putRow(storeName: string, row: Record<string, unknown>): Promise<void> {
  const db = await openDb();
  await new Promise<void>((resolve, reject) => {
    const tx = db.transaction(storeName, "readwrite");
    tx.onerror = () => reject(tx.error);
    tx.onabort = () => reject(tx.error ?? new Error(`IndexedDB ${storeName} transaction aborted`));
    tx.oncomplete = () => resolve();
    tx.objectStore(storeName).put(row);
  });
}

function notifyStorageChanged(detail: WasmStorageChangedDetail): void {
  if (typeof window === "undefined") return;
  window.dispatchEvent(new CustomEvent<WasmStorageChangedDetail>(WASM_STORAGE_CHANGED_EVENT, { detail }));
}

async function deleteRowsForUser(storeName: string, userId: string, id: string): Promise<void> {
  const db = await openDb();
  const prefix = `${userPrefix(userId)}::`;
  await new Promise<void>((resolve, reject) => {
    const tx = db.transaction(storeName, "readwrite");
    tx.onerror = () => reject(tx.error);
    tx.oncomplete = () => resolve();
    const store = tx.objectStore(storeName);
    const req = store.openCursor();
    req.onsuccess = () => {
      const cursor = req.result;
      if (!cursor) return;
      const key = String((cursor.value as { key?: string }).key ?? "");
      if (key.startsWith(prefix) && key.includes(`::${id}`)) {
        cursor.delete();
      }
      cursor.continue();
    };
  });
}

export async function wasmStorageLoadSnapshot(payload: { userId?: string }): Promise<string> {
  const userId = payload.userId?.trim();
  if (!userId) {
    return JSON.stringify({ messages: [], conversations: [], cursors: {}, pendingSends: [] });
  }
  const [messageRows, conversationRows, cursorRows, pendingRows] = await Promise.all([
    getAllForUser<{ userId: string; message: Record<string, unknown> }>(WASM_MESSAGES, userId),
    getAllForUser<{ userId: string; conversation: Record<string, unknown> }>(
      WASM_CONVERSATIONS,
      userId,
    ),
    getAllForUser<{ userId: string; key: string; value: string }>(WASM_CURSORS, userId),
    getAllForUser<{ userId: string; entry: Record<string, unknown> }>(WASM_PENDING_SENDS, userId),
  ]);
  const cursors: Record<string, string> = {};
  for (const row of cursorRows) {
    const cursorKey =
      (row as { cursorKey?: string }).cursorKey ??
      String(row.key).split("::").slice(1).join("::");
    cursors[cursorKey] = row.value;
  }
  const canonicalMessages = messageRows.filter((row) => isCanonicalStoredMessage(row.message));
  const canonicalConversations = conversationRows.filter((row) => isCanonicalStoredConversation(row.conversation));
  const invalidMessageKeys = messageRows
    .filter((row) => !isCanonicalStoredMessage(row.message))
    .map((row) => String((row as { key?: string }).key ?? ""))
    .filter(Boolean);
  const invalidConversationKeys = conversationRows
    .filter((row) => !isCanonicalStoredConversation(row.conversation))
    .map((row) => String((row as { key?: string }).key ?? ""))
    .filter(Boolean);
  void deleteRowsByKeys(WASM_MESSAGES, invalidMessageKeys).catch(() => undefined);
  void deleteRowsByKeys(WASM_CONVERSATIONS, invalidConversationKeys).catch(() => undefined);
  return JSON.stringify({
    messages: canonicalMessages.map((row) => row.message),
    conversations: canonicalConversations.map((row) => row.conversation),
    cursors,
    pendingSends: pendingRows.map((row) => row.entry),
  });
}

export async function wasmStorageSaveMessage(payload: PersistMessagePayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId) return;
  const message = payload.message ?? {};
  const conversationId = messageConversationId(message);
  await putRow(WASM_MESSAGES, {
    key: messageKey(userId, message),
    userId: userPrefix(userId),
    message,
  });
  notifyStorageChanged({
    userId,
    kind: "message",
    conversationId,
    message,
  });
}

export async function wasmStorageSaveConversation(payload: PersistConversationPayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId) return;
  const conversation = payload.conversation ?? {};
  const conversationId = conversationIdFromConversation(conversation);
  await putRow(WASM_CONVERSATIONS, {
    key: `${userPrefix(userId)}::${conversationId}`,
    userId: userPrefix(userId),
    conversation,
  });
  notifyStorageChanged({
    userId,
    kind: "conversation",
    conversationId,
    conversation,
  });
}

export async function wasmStorageSaveCursor(payload: PersistCursorPayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId || !payload.key) return;
  await putRow(WASM_CURSORS, {
    key: `${userPrefix(userId)}::${payload.key}`,
    userId: userPrefix(userId),
    cursorKey: payload.key,
    value: payload.value,
  });
  notifyStorageChanged({
    userId,
    kind: "cursor",
    id: payload.key,
  });
}

export async function wasmStorageSavePendingSend(payload: PersistPendingSendPayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId) return;
  const entry = payload.entry ?? {};
  await putRow(WASM_PENDING_SENDS, {
    key: pendingSendKey(userId, entry),
    userId: userPrefix(userId),
    entry,
  });
  notifyStorageChanged({
    userId,
    kind: "pending_send",
    id: String(entry.clientMsgId ?? ""),
  });
}

export async function wasmStorageDeleteMessage(payload: DeletePayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId || !payload.id) return;
  await deleteRowsForUser(WASM_MESSAGES, userId, payload.id);
  notifyStorageChanged({
    userId,
    kind: "delete",
    id: payload.id,
  });
}

export async function wasmStorageDeleteConversation(payload: DeletePayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId || !payload.id) return;
  const db = await openDb();
  await requestToPromise(
    db
      .transaction(WASM_CONVERSATIONS, "readwrite")
      .objectStore(WASM_CONVERSATIONS)
      .delete(`${userPrefix(userId)}::${payload.id}`),
  );
  notifyStorageChanged({
    userId,
    kind: "delete",
    conversationId: payload.id,
    id: payload.id,
  });
}

export async function wasmStorageDeletePendingSend(payload: DeletePayload): Promise<void> {
  const userId = payload.userId?.trim();
  if (!userId || !payload.id) return;
  const db = await openDb();
  await requestToPromise(
    db
      .transaction(WASM_PENDING_SENDS, "readwrite")
      .objectStore(WASM_PENDING_SENDS)
      .delete(`${userPrefix(userId)}::${payload.id}`),
  );
  notifyStorageChanged({
    userId,
    kind: "delete",
    id: payload.id,
  });
}

function cryptoSafeId(): string {
  if (typeof crypto !== "undefined" && "randomUUID" in crypto) return crypto.randomUUID();
  return Math.random().toString(36).slice(2);
}

export type WasmStorageHostCallbacks = {
  loadSnapshot: (payload: { userId?: string }) => Promise<string>;
  saveMessage: (payload: PersistMessagePayload) => Promise<void>;
  saveConversation: (payload: PersistConversationPayload) => Promise<void>;
  saveCursor: (payload: PersistCursorPayload) => Promise<void>;
  savePendingSend: (payload: PersistPendingSendPayload) => Promise<void>;
  deleteMessage: (payload: DeletePayload) => Promise<void>;
  deleteConversation: (payload: DeletePayload) => Promise<void>;
  deletePendingSend: (payload: DeletePayload) => Promise<void>;
};

export function createWasmIndexedDbStorageHost(): WasmStorageHostCallbacks {
  return {
    loadSnapshot: wasmStorageLoadSnapshot,
    saveMessage: wasmStorageSaveMessage,
    saveConversation: wasmStorageSaveConversation,
    saveCursor: wasmStorageSaveCursor,
    savePendingSend: wasmStorageSavePendingSend,
    deleteMessage: wasmStorageDeleteMessage,
    deleteConversation: wasmStorageDeleteConversation,
    deletePendingSend: wasmStorageDeletePendingSend,
  };
}
