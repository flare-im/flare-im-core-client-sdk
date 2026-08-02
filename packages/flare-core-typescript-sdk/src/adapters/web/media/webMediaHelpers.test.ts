import { describe, expect, it } from "vitest";

import {
  mediaAccessPayload,
  pickDisplayUrlFromResolved,
  pickMediaAccessUrl,
  readResolvedRemote,
} from "./webMediaHelpers";

describe("pickMediaAccessUrl", () => {
  it("prefers the core media url over cdnUrl", () => {
    expect(
      pickMediaAccessUrl({
        url: "https://gateway.example/file",
        cdnUrl: "https://cdn.example/file",
      }),
    ).toBe("https://gateway.example/file");
  });

  it("does not read removed snake_case cdn_url", () => {
    expect(
      pickMediaAccessUrl({
        url: "https://gateway.example/file",
        cdn_url: "https://cdn.example/file",
      }),
    ).toBe("https://gateway.example/file");
  });

  it("returns empty string when remote access is missing", () => {
    expect(pickMediaAccessUrl(undefined)).toBe("");
  });
});

describe("pickDisplayUrlFromResolved", () => {
  it("reads the core media url before cdnUrl from canonical payload", () => {
    const url = pickDisplayUrlFromResolved({
      source: "remote",
      remote: {
        url: "https://gateway.example/a",
        cdnUrl: "https://cdn.example/a",
      },
    });
    expect(url).toBe("https://gateway.example/a");
  });

  it("accepts http(s)/blob local paths for display", () => {
    expect(
      pickDisplayUrlFromResolved({
        source: "remote",
        localPath: "https://signed.example/object",
      }),
    ).toBe("https://signed.example/object");
  });

  it("ignores non-http cache-api virtual paths", () => {
    expect(
      pickDisplayUrlFromResolved({
        source: "cache",
        localPath: "cache-api://demo-file",
      }),
    ).toBe("");
  });
});

describe("readResolvedRemote", () => {
  it("returns remote object when present", () => {
    const remote = { url: "https://gateway.example/x" };
    expect(readResolvedRemote({ remote })).toEqual(remote);
  });
});

describe("mediaAccessPayload", () => {
  it("maps mediaUrl and expiresInSeconds for wasm ffi", () => {
    expect(
      mediaAccessPayload({
        fileId: "f1",
        mediaUrl: "https://gateway.example/f1",
        expiresInSeconds: 900,
      }),
    ).toEqual({
      fileId: "f1",
      url: "https://gateway.example/f1",
      mediaUrl: "https://gateway.example/f1",
      expiresIn: 900,
    });
  });
});
