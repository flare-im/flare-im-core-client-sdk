import type { MediaApi } from "../api/modules/media";
import type { MediaUploadResponse } from "../api/types";

export type MediaUploadOptions = Record<string, unknown> | null;

export interface MediaUploadFileLike {
  readonly name?: string;
  readonly type?: string;
  readonly size: number;
  arrayBuffer(): Promise<ArrayBuffer>;
}

export type MediaUploadInput =
  | {
      source: "file";
      file: MediaUploadFileLike;
      kind: string;
      fileName?: string;
      mimeType?: string;
      options?: MediaUploadOptions;
    }
  | {
      source: "path";
      path: string;
      kind: string;
      fileName?: string;
      mimeType?: string;
      options?: MediaUploadOptions;
    }
  | {
      source: "bytes";
      bytes: ArrayBuffer | ArrayBufferView | readonly number[];
      kind: string;
      fileName: string;
      mimeType: string;
      options?: MediaUploadOptions;
    };

export type MediaUploadApi = Pick<MediaApi, "uploadBytes" | "uploadFile">;

function requireNonEmpty(value: string | undefined, field: string): string {
  const trimmed = String(value ?? "").trim();
  if (!trimmed) {
    throw new Error(`${field} is required`);
  }
  return trimmed;
}

function bytesToJsonArray(bytes: ArrayBuffer | ArrayBufferView | readonly number[]): number[] {
  if (Array.isArray(bytes)) {
    return bytes.map((byte) => byte & 0xff);
  }
  if (ArrayBuffer.isView(bytes)) {
    return Array.from(new Uint8Array(bytes.buffer, bytes.byteOffset, bytes.byteLength));
  }
  return Array.from(new Uint8Array(bytes));
}

function mimeTypeOrDefault(value: string | undefined): string {
  return String(value ?? "").trim() || "application/octet-stream";
}

export async function uploadMediaInput(
  media: MediaUploadApi,
  input: MediaUploadInput,
): Promise<MediaUploadResponse> {
  const kind = requireNonEmpty(input.kind, "kind");
  if (input.source === "path") {
    return await media.uploadFile({
      path: requireNonEmpty(input.path, "path"),
      kind,
      fileName: input.fileName,
      mimeType: input.mimeType,
      options: input.options ?? null,
    });
  }

  if (input.source === "file") {
    if (!input.file.size) {
      throw new Error("media file is empty");
    }
    const fileName = requireNonEmpty(input.fileName ?? input.file.name, "fileName");
    const mimeType = mimeTypeOrDefault(input.mimeType ?? input.file.type);
    return await media.uploadBytes({
      bytes: bytesToJsonArray(await input.file.arrayBuffer()),
      fileName,
      mimeType,
      kind,
      options: input.options ?? null,
    });
  }

  const fileName = requireNonEmpty(input.fileName, "fileName");
  const mimeType = mimeTypeOrDefault(input.mimeType);
  const bytes = bytesToJsonArray(input.bytes);
  if (bytes.length === 0) {
    throw new Error("media bytes are empty");
  }
  return await media.uploadBytes({
    bytes,
    fileName,
    mimeType,
    kind,
    options: input.options ?? null,
  });
}
