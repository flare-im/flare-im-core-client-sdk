// GENERATED. Do not edit by hand.
import { NativeBridge, NativeCallMap } from '../../contract/BridgeContract';
import type { MediaApi } from '../../api/modules/media';
import { invokeBool, invokeMap, invokeVoid } from '../codec/NativeInvoke';

export class DefaultMediaApi implements MediaApi {
  constructor(private readonly bridge: NativeBridge) {}

  async uploadFile(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaUploadFile, request);
  }

  async uploadImage(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaUploadImage, request);
  }

  async uploadVideo(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaUploadVideo, request);
  }

  async uploadBytes(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaUploadBytes, request);
  }

  async deleteFile(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaDeleteFile, request);
  }

  async getMediaUrl(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaGetUrl, request);
  }

  async getTempDownloadUrl(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaTempDownloadUrl, request);
  }

  async resolveMediaAccess(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaResolveAccess, request);
  }

  async cacheRemoteMedia(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaCacheRemote, request);
  }

  async getMediaCacheStats(): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaCacheStats);
  }

  async setMediaCacheMaxBytes(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.mediaSetCacheMaxBytes, request);
  }

  async setMediaCacheRoot(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.mediaSetCacheRoot, request);
  }

  async clearMediaCache(): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.mediaClearCache);
  }

  async getUserDownloadSubfolder(): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaUserDownloadGetSubfolder);
  }

  async setUserDownloadSubfolder(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.mediaUserDownloadSetSubfolder, request);
  }

  async getUserDownloadSavedPath(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaUserDownloadGetSavedPath, request);
  }

  async deleteUserDownloadRecord(request: Record<string, Object>): Promise<void> {
    await invokeVoid(this.bridge, NativeCallMap.mediaUserDownloadDeleteRecord, request);
  }

  async cancelUserFileDownload(request: Record<string, Object>): Promise<boolean> {
    return await invokeBool(this.bridge, NativeCallMap.mediaCancelUserFileDownload, request);
  }

  async downloadFileToDownloads(request: Record<string, Object>): Promise<Record<string, Object>> {
    return await invokeMap(this.bridge, NativeCallMap.mediaDownloadFileToDownloads, request);
  }
}
