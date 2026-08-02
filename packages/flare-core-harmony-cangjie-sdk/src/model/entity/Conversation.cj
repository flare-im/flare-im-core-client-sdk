package flare_core_harmony_cangjie_sdk.model.entity

// GENERATED. Do not edit by hand.
// Collection/map payloads are represented as raw JSON strings at the bridge boundary.
// SDK 层会话类型：内部统一使用，从 proto ConversationSummary 获取后即转换为此类型。 与 message.rs 的 IMMessage 一致：扁平字段、serde camelCase。
public class Conversation {
    // wire: `avatarUrl`. 
    public let avatarUrl: String
    // wire: `badge`. Optional. 
    public let badge: ?String
    // wire: `businessType`. 
    public let businessType: String
    // wire: `channelId`. 会话路由 ID：单聊为对方 user_id；群/频道为业务 channel（与 proto `channel_id` 一致）
    public let channelId: String
    // wire: `conversationId`. 
    public let conversationId: String
    // wire: `conversationType`. 
    public let conversationType: ConversationType
    // wire: `createdAt`. 
    public let createdAt: UInt64
    // wire: `description`. Optional. 
    public let description: ?String
    // wire: `displayName`. 展示名（列表主标题）
    public let displayName: String
    // wire: `draft`. Optional. 
    public let draft: ?String
    // wire: `ext`. 扩展键值（与 proto ext 对应）
    public let ext: String
    // wire: `isArchived`. 
    public let isArchived: Bool
    // wire: `isMuted`. 
    public let isMuted: Bool
    // wire: `isPinned`. 
    public let isPinned: Bool
    // wire: `lastMessage`. Optional. 
    public let lastMessage: ?MessagePreview
    // wire: `lastMessageAt`. Optional. 
    public let lastMessageAt: ?UInt64
    // wire: `lastMessageId`. Optional. 
    public let lastMessageId: ?String
    // wire: `lastMessagePreview`. Optional. 
    public let lastMessagePreview: ?String
    // wire: `lastReadSeq`. 已读序列号（与 read_seq 同义）
    public let lastReadSeq: UInt64
    // wire: `lastSenderAvatarUrl`. 最后一条消息发送者头像 URL
    public let lastSenderAvatarUrl: String
    // wire: `lastSenderId`. Optional. 
    public let lastSenderId: ?String
    // wire: `lastSenderNickname`. 最后一条消息发送者展示名（列表用）
    public let lastSenderNickname: String
    // wire: `maxSeq`. 
    public let maxSeq: UInt64
    // wire: `memberPreview`. 摘要级成员预览，最多少量成员，不能作为完整成员列表使用。
    public let memberPreview: String
    // wire: `membersCount`. 
    public let membersCount: UInt32
    // wire: `mentionCount`. 
    public let mentionCount: UInt32
    // wire: `mentionMe`. 
    public let mentionMe: Bool
    // wire: `participantVersion`. 服务端成员读模型版本。完整成员通过独立 participants 同步拉取。
    public let participantVersion: UInt64
    // wire: `participants`. 已按需同步到本地的完整成员快照；会话摘要同步不会填充该字段。
    public let participants: String
    // wire: `peerReadSeq`. 对端（其他成员）最大已读序列号；用于发送方已读双勾在重连/重登后恢复。 由服务端同步摘要 `ext.peer_read_seq` 下发并持久化。
    public let peerReadSeq: UInt64
    // wire: `remark`. Optional. 
    public let remark: ?String
    // wire: `role`. Optional. 
    public let role: ?String
    // wire: `unreadCount`. 
    public let unreadCount: UInt32
    // wire: `updatedAt`. 
    public let updatedAt: UInt64
    // wire: `updatedAtTs`. Optional. 更新时间戳（毫秒，用于排序/筛选）
    public let updatedAtTs: ?UInt64
    // wire: `version`. 
    public let version: UInt64
    // wire: `visibleAfterSeq`. 当前用户的历史可见边界；seq <= visible_after_seq 的消息不可见，不参与冷启动回灌。
    public let visibleAfterSeq: UInt64

    public init(avatarUrl!: String, badge!: ?String, businessType!: String, channelId!: String, conversationId!: String, conversationType!: ConversationType, createdAt!: UInt64, description!: ?String, displayName!: String, draft!: ?String, ext!: String, isArchived!: Bool, isMuted!: Bool, isPinned!: Bool, lastMessage!: ?MessagePreview, lastMessageAt!: ?UInt64, lastMessageId!: ?String, lastMessagePreview!: ?String, lastReadSeq!: UInt64, lastSenderAvatarUrl!: String, lastSenderId!: ?String, lastSenderNickname!: String, maxSeq!: UInt64, memberPreview!: String, membersCount!: UInt32, mentionCount!: UInt32, mentionMe!: Bool, participantVersion!: UInt64, participants!: String, peerReadSeq!: UInt64, remark!: ?String, role!: ?String, unreadCount!: UInt32, updatedAt!: UInt64, updatedAtTs!: ?UInt64, version!: UInt64, visibleAfterSeq!: UInt64) {
        this.avatarUrl = avatarUrl
        this.badge = badge
        this.businessType = businessType
        this.channelId = channelId
        this.conversationId = conversationId
        this.conversationType = conversationType
        this.createdAt = createdAt
        this.description = description
        this.displayName = displayName
        this.draft = draft
        this.ext = ext
        this.isArchived = isArchived
        this.isMuted = isMuted
        this.isPinned = isPinned
        this.lastMessage = lastMessage
        this.lastMessageAt = lastMessageAt
        this.lastMessageId = lastMessageId
        this.lastMessagePreview = lastMessagePreview
        this.lastReadSeq = lastReadSeq
        this.lastSenderAvatarUrl = lastSenderAvatarUrl
        this.lastSenderId = lastSenderId
        this.lastSenderNickname = lastSenderNickname
        this.maxSeq = maxSeq
        this.memberPreview = memberPreview
        this.membersCount = membersCount
        this.mentionCount = mentionCount
        this.mentionMe = mentionMe
        this.participantVersion = participantVersion
        this.participants = participants
        this.peerReadSeq = peerReadSeq
        this.remark = remark
        this.role = role
        this.unreadCount = unreadCount
        this.updatedAt = updatedAt
        this.updatedAtTs = updatedAtTs
        this.version = version
        this.visibleAfterSeq = visibleAfterSeq
    }
}
