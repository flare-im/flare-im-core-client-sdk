import type { FlareJsonObject } from '../../../api/types';
export {
  pickDisplayUrlFromResolved,
  pickMediaAccessUrl,
  readResolvedRemote,
  type MediaAccessLike,
  type MediaResolvedAccessLike,
} from '../../../adapter/media/mediaAccess';

export function mediaAccessPayload(command: {
  fileId?: string;
  url?: string;
  mediaUrl?: string;
  expiresInSeconds?: number;
}): FlareJsonObject {
  return {
    fileId: command.fileId,
    url: command.url ?? command.mediaUrl,
    mediaUrl: command.mediaUrl ?? command.url,
    ...(command.expiresInSeconds !== undefined
      ? { expiresIn: command.expiresInSeconds }
      : {}),
  };
}
