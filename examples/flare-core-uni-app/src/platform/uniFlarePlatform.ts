import {
  configureAppMediaLocalPathResolver,
  configureAppMediaPathPicker,
  type AppMediaPathPickerRequest,
} from "@flare-im/vue-ui/app";

type UniTempFile = {
  path?: string;
  tempFilePath?: string;
  name?: string;
};

type UniChooseImageResult = {
  tempFilePaths?: string[];
  tempFiles?: UniTempFile[];
};

type UniChooseVideoResult = {
  tempFilePath?: string;
};

type UniChooseMessageFileResult = {
  tempFiles?: UniTempFile[];
};

type UniLike = {
  chooseImage?: (options: {
    count?: number;
    sourceType?: string[];
    success: (result: UniChooseImageResult) => void;
    fail: (error: unknown) => void;
  }) => void;
  chooseVideo?: (options: {
    sourceType?: string[];
    success: (result: UniChooseVideoResult) => void;
    fail: (error: unknown) => void;
  }) => void;
  chooseMessageFile?: (options: {
    count?: number;
    type?: "all" | "video" | "image" | "file";
    success: (result: UniChooseMessageFileResult) => void;
    fail: (error: unknown) => void;
  }) => void;
  convertFileSrc?: (path: string) => string;
};

type PlusLike = {
  io?: {
    convertLocalFileSystemURL?: (path: string) => string;
  };
};

function uniRuntime(): UniLike | undefined {
  return (globalThis as { uni?: UniLike }).uni;
}

function plusRuntime(): PlusLike | undefined {
  return (globalThis as { plus?: PlusLike }).plus;
}

function isImageRequest(request: AppMediaPathPickerRequest): boolean {
  return request.kind === "image" || request.accept.includes("image/");
}

function isVideoRequest(request: AppMediaPathPickerRequest): boolean {
  return request.kind === "video" || request.accept.includes("video/");
}

function isAudioRequest(request: AppMediaPathPickerRequest): boolean {
  return request.kind === "audio" || request.accept.includes("audio/");
}

function tempFilePath(file: UniTempFile): string {
  return String(file.path || file.tempFilePath || "").trim();
}

function rejectToEmpty(resolve: (value: string[]) => void): (error: unknown) => void {
  return () => resolve([]);
}

function pickImages(uni: UniLike, request: AppMediaPathPickerRequest): Promise<string[]> {
  return new Promise((resolve) => {
    uni.chooseImage?.({
      count: request.multiple ? 9 : 1,
      sourceType: ["album", "camera"],
      success: (result) => {
        const paths = result.tempFilePaths?.length
          ? result.tempFilePaths
          : (result.tempFiles ?? []).map(tempFilePath);
        resolve(paths.map((path) => path.trim()).filter(Boolean));
      },
      fail: rejectToEmpty(resolve),
    });
  });
}

function pickVideo(uni: UniLike): Promise<string[]> {
  return new Promise((resolve) => {
    uni.chooseVideo?.({
      sourceType: ["album", "camera"],
      success: (result) => resolve(result.tempFilePath ? [result.tempFilePath] : []),
      fail: rejectToEmpty(resolve),
    });
  });
}

function pickMessageFiles(uni: UniLike, request: AppMediaPathPickerRequest): Promise<string[]> {
  return new Promise((resolve) => {
    uni.chooseMessageFile?.({
      count: request.multiple ? 9 : 1,
      type: isImageRequest(request) ? "image" : isVideoRequest(request) ? "video" : "file",
      success: (result) => resolve((result.tempFiles ?? []).map(tempFilePath).filter(Boolean)),
      fail: rejectToEmpty(resolve),
    });
  });
}

async function pickUniMediaSourcePaths(request: AppMediaPathPickerRequest): Promise<string[]> {
  const uni = uniRuntime();
  if (!uni) return [];

  if (isImageRequest(request) && uni.chooseImage) return pickImages(uni, request);
  if (isVideoRequest(request) && uni.chooseVideo) return pickVideo(uni);
  if ((request.kind === "file" || isAudioRequest(request) || request.accept) && uni.chooseMessageFile) {
    return pickMessageFiles(uni, request);
  }
  return [];
}

function resolveUniLocalPath(path: string): string {
  const value = path.trim();
  if (!value) return "";
  if (/^(https?:|blob:|data:|file:|wxfile:|_doc\/|_downloads\/)/i.test(value)) return value;

  const uni = uniRuntime();
  const convertedByUni = uni?.convertFileSrc?.(value);
  if (convertedByUni) return convertedByUni;

  const convertedByPlus = plusRuntime()?.io?.convertLocalFileSystemURL?.(value);
  return convertedByPlus || value;
}

export function installUniFlarePlatformAdapters(): void {
  configureAppMediaPathPicker(pickUniMediaSourcePaths);
  configureAppMediaLocalPathResolver(resolveUniLocalPath);
}
