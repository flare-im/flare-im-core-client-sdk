// GENERATED. Do not edit by hand.

/** MessageLocalState */
export interface MessageLocalState {
  /** wire: `failed`. 是否失败 */
  failed: boolean;
  /** wire: `isLocal`. 本地消息 */
  isLocal: boolean;
  /** wire: `sending`. 是否发送中 */
  sending: boolean;
  /** wire: `sortTs`. 本地列表排序时间（毫秒），**不是**服务端会话 `conversation_seq`。 用途：待发/未 ACK 消息常保持 `conversation_seq == 0`，可用本字段稳定停留在本地时间线尾部。 已分配 `conversation_seq` 的服务端消息必须回到 seq 优先排序，避免设备时钟偏移污染权威顺序。 */
  sortTs: number;
  /** wire: `uploadProgress`. 本地媒体上传进度，范围 0..=100。 */
  uploadProgress: number;
  /** wire: `uploading`. 本地媒体上传中；仅用于 SDK 本地时间线展示，不写入服务端协议语义。 */
  uploading: boolean;
}
