import type { MediaApi } from '../../../api/modules/media';
import type {
  CacheRemoteMediaRequest,
  CancelUserFileDownloadRequest,
  DeleteMediaFileRequest,
  DeleteMediaFileResponse,
  DeleteUserDownloadRecordRequest,
  DownloadFileToDownloadsRequest,
  GetMediaUrlRequest,
  GetUserDownloadSavedPathRequest,
  MediaAccessUrl,
  MediaCacheEntry,
  MediaCacheStats,
  MediaResolvedAccess,
  MediaUploadResponse,
  ResolveMediaAccessRequest,
  SetMediaCacheMaxBytesRequest,
  SetMediaCacheRootRequest,
  SetUserDownloadSubfolderRequest,
  TempDownloadUrlRequest,
  UploadBytesRequest,
  UploadFileRequest,
  UserDownloadSavedPathResponse,
  UserDownloadSubfolderResponse,
} from '../../../api/types';
import { FlareSdkException } from '../../../bridge/flareSdkException';
import {
  browserMediaCacheStats,
  clearBrowserMediaCache,
  hasBrowserMedia,
  isBrowserMediaCacheAvailable,
  openBrowserMediaBlobUrl,
  cacheBrowserMedia,
  revokeBrowserMediaBlobUrl,
} from './browserMediaCache';
import { pickDisplayUrlFromResolved } from './webMediaHelpers';

const WEB_CACHE_UNSUPPORTED =
  'Native media cache is disabled on web/wasm. Use resolveMediaAccess(), resolveDisplayUrl(), or cacheRemoteMedia() with browser Cache API.';

function unsupported(operation: string): never {
  throw new FlareSdkException('operation.not_supported', WEB_CACHE_UNSUPPORTED, operation);
}

/**
 * Web media API: gateway presigned URLs + optional browser Cache API storage.
 * Does not persist blobs in IndexedDB or WASM storage.
 */
export class WebMediaApi implements MediaApi {
  private constructor(private readonly inner: MediaApi) {}

  readonly cacheApiAvailable = isBrowserMediaCacheAvailable();

  static fromInner(inner: MediaApi): WebMediaApi {
    return new WebMediaApi(inner);
  }

  async uploadFile(request: UploadFileRequest): Promise<MediaUploadResponse> {
    return this.inner.uploadFile(request);
  }

  async uploadImage(request: UploadFileRequest): Promise<MediaUploadResponse> {
    return this.inner.uploadImage(request);
  }

  async uploadVideo(request: UploadFileRequest): Promise<MediaUploadResponse> {
    return this.inner.uploadVideo(request);
  }

  async uploadBytes(request: UploadBytesRequest): Promise<MediaUploadResponse> {
    return this.inner.uploadBytes(request);
  }

  async deleteFile(request: DeleteMediaFileRequest): Promise<DeleteMediaFileResponse> {
    return this.inner.deleteFile(request);
  }

  async getMediaUrl(request: GetMediaUrlRequest): Promise<MediaAccessUrl> {
    return this.inner.getMediaUrl(request);
  }

  async getTempDownloadUrl(request: TempDownloadUrlRequest): Promise<MediaAccessUrl> {
    return this.inner.getTempDownloadUrl(request);
  }

  async resolveMediaAccess(request: ResolveMediaAccessRequest): Promise<MediaResolvedAccess> {
    const resolved = await this.inner.resolveMediaAccess(request);
    const displayUrl = pickDisplayUrlFromResolved(resolved);
    if (displayUrl) {
      return resolved;
    }
    return resolved;
  }

  async resolveDisplayUrl(request: ResolveMediaAccessRequest): Promise<string> {
    const fileId = String(request.fileId ?? '').trim();
    if (fileId && (await hasBrowserMedia(fileId))) {
      const blobUrl = await openBrowserMediaBlobUrl(fileId);
      if (blobUrl) return blobUrl;
    }
    const resolved = await this.resolveMediaAccess(request);
    const url = pickDisplayUrlFromResolved(resolved);
    if (!url) {
      throw new FlareSdkException('generalError', 'empty media display url', 'media.resolve_display_url');
    }
    return url;
  }

  revokeDisplayUrl(url: string): void {
    revokeBrowserMediaBlobUrl(url);
  }

  async cacheRemoteMedia(request: CacheRemoteMediaRequest): Promise<MediaCacheEntry> {
    return this.cacheRemoteWithBrowserCache(request);
  }

  async getMediaCacheStats(): Promise<MediaCacheStats> {
    return browserMediaCacheStats() as Promise<MediaCacheStats>;
  }

  async setMediaCacheMaxBytes(_request: SetMediaCacheMaxBytesRequest): Promise<void> {
    unsupported('media.set_cache_max_bytes');
  }

  async setMediaCacheRoot(_request: SetMediaCacheRootRequest): Promise<void> {
    unsupported('media.set_cache_root');
  }

  async clearMediaCache(): Promise<void> {
    await clearBrowserMediaCache();
  }

  async getUserDownloadSubfolder(): Promise<UserDownloadSubfolderResponse> {
    unsupported('media.user_download_get_subfolder');
  }

  async setUserDownloadSubfolder(_request: SetUserDownloadSubfolderRequest): Promise<void> {
    unsupported('media.user_download_set_subfolder');
  }

  async getUserDownloadSavedPath(_request: GetUserDownloadSavedPathRequest): Promise<UserDownloadSavedPathResponse> {
    unsupported('media.user_download_get_saved_path');
  }

  async deleteUserDownloadRecord(_request: DeleteUserDownloadRecordRequest): Promise<void> {
    unsupported('media.user_download_delete_record');
  }

  async cancelUserFileDownload(_request: CancelUserFileDownloadRequest): Promise<boolean> {
    unsupported('media.cancel_user_file_download');
  }

  async downloadFileToDownloads(_request: DownloadFileToDownloadsRequest): Promise<UserDownloadSavedPathResponse> {
    unsupported('media.download_file_to_downloads');
  }

  private async cacheRemoteWithBrowserCache(request: CacheRemoteMediaRequest): Promise<MediaCacheEntry> {
    const fileId = String(request.fileId ?? '').trim();
    if (!fileId) {
      throw new FlareSdkException('invalidParameter', 'fileId is required', 'media.cache_remote');
    }
    if (!isBrowserMediaCacheAvailable()) {
      throw new FlareSdkException(
        'operation.not_supported',
        'Cache API is unavailable in this environment',
        'media.cache_remote',
      );
    }
    const resolved = await this.resolveMediaAccess(request);
    const url = pickDisplayUrlFromResolved(resolved);
    if (!url) {
      throw new FlareSdkException('generalError', 'empty media download url', 'media.cache_remote');
    }
    await cacheBrowserMedia(fileId, url);
    return {
      fileId,
      localPath: `cache-api://${fileId}`,
      mimeType: '',
      sizeBytes: 0,
      updatedAtMs: Date.now(),
    };
  }
}
