import { describe, expect, it, vi } from "vitest";

import {
  buildLocalImageGroupMessage,
  buildLocalMediaMessage,
  localMediaSource,
  mediaKindForMime,
  type LocalMediaMessageBuilder,
} from "../src/media";

function recordingBuilder() {
  const calls: Array<[string, unknown]> = [];
  const record = (op: string) => vi.fn(async (request: unknown) => {
    calls.push([op, request]);
    return { clientMsgId: op } as never;
  });
  const builder: LocalMediaMessageBuilder = {
    buildImage: record("image"),
    buildVideo: record("video"),
    buildAudio: record("audio"),
    buildFile: record("file"),
    buildImageGroup: record("imageGroup"),
  };
  return { builder, calls };
}

describe("local media source", () => {
  it("carries the file's name and size in the data URL header the core reads", async () => {
    const file = new File([new Uint8Array([104, 101, 108, 108, 111])], "季度 报告;v2.pdf", { type: "application/pdf" });

    const source = await localMediaSource(file);

    expect(source).toBe(`data:application/pdf;name=${encodeURIComponent("季度 报告;v2.pdf")};size=5;base64,aGVsbG8=`);
    // A `;` or `,` in the name would end the header early.
    expect(source).not.toContain("报告;v2");
    await expect(localMediaSource(new File([new Uint8Array([1])], "blob"))).resolves.toMatch(
      /^data:application\/octet-stream;name=blob;size=1;base64,AQ==$/,
    );
  });

  it("builds each kind from the file itself and an album from several pictures", async () => {
    const { builder, calls } = recordingBuilder();

    await buildLocalMediaMessage(builder, "c1", new File([new Uint8Array([1, 2, 3])], "clip.mp4", { type: "video/mp4" }));
    await buildLocalMediaMessage(builder, "c1", new File([new Uint8Array([9])], "notes.txt", { type: "text/plain" }));
    await buildLocalMediaMessage(builder, "c1", new File([new Uint8Array([7])], "v.m4a", { type: "audio/mp4" }));
    await buildLocalImageGroupMessage(builder, "c1", [
      new File([new Uint8Array([1])], "a.png", { type: "image/png" }),
      new File([new Uint8Array([2])], "b.jpg", { type: "image/jpeg" }),
    ]);

    expect(calls).toEqual([
      ["video", { conversationId: "c1", videoId: "data:video/mp4;name=clip.mp4;size=3;base64,AQID" }],
      ["file", { conversationId: "c1", fileId: "data:text/plain;name=notes.txt;size=1;base64,CQ==" }],
      ["audio", { conversationId: "c1", audioId: "data:audio/mp4;name=v.m4a;size=1;base64,Bw==" }],
      ["imageGroup", {
        conversationId: "c1",
        payload: {
          images: [
            { imageId: "data:image/png;name=a.png;size=1;base64,AQ==" },
            { imageId: "data:image/jpeg;name=b.jpg;size=1;base64,Ag==" },
          ],
        },
      }],
    ]);
  });

  it("picks the kind by MIME type", () => {
    expect(["image/gif", "VIDEO/QuickTime", "audio/mp4", "application/zip", "", undefined].map(mediaKindForMime)).toEqual([
      "image", "video", "audio", "file", "file", "file",
    ]);
  });
});
