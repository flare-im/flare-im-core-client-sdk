import type { NativeBridge } from '../../contract/bridge_contract';
import { DefaultFlareImClient } from '../../adapter/defaultFlareImClient';
import type { DefaultEventsApi } from '../../adapter/module/DefaultEventsApi';
import { WebMediaApi } from './media/WebMediaApi';

type EventAttachableBridge = NativeBridge & {
  attachEventEmitter?: (api: DefaultEventsApi) => void;
};

/** Web IM client: WASM/core transport with web-optimized media (gateway URL + Cache API). */
export class WebFlareImClient extends DefaultFlareImClient {
  declare readonly media: WebMediaApi;

  constructor(bridge: NativeBridge) {
    super(bridge);
    (bridge as EventAttachableBridge).attachEventEmitter?.(this.events as DefaultEventsApi);
    const innerMedia = (this as DefaultFlareImClient).media;
    Object.assign(this, {
      media: WebMediaApi.fromInner(innerMedia),
    });
  }
}
