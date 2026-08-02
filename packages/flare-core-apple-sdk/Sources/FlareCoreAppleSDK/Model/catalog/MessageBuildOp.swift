import Foundation

/// GENERATED. Do not edit by hand.
/// Dispatch op passed to flare_message_build_json.
public enum MessageBuildOp: String, Codable, Sendable {
    case createText = "create_text"
    case createQuote = "create_quote"
    case createThreadReply = "create_thread_reply"
    case createForward = "create_forward"
    case createImage = "create_image"
    case createImageGroup = "create_image_group"
    case createVideo = "create_video"
    case createAudio = "create_audio"
    case createFile = "create_file"
    case createEmoji = "create_emoji"
    case createLocation = "create_location"
    case createSticker = "create_sticker"
    case createLinkCard = "create_link_card"
    case createCard = "create_card"
    case createMiniProgram = "create_mini_program"
    case createRichDoc = "create_rich_doc"
    case createSystem = "create_system"
    case createNotification = "create_notification"
    case createVote = "create_vote"
    case createTask = "create_task"
    case createSchedule = "create_schedule"
    case createAnnouncement = "create_announcement"
    case createCustom = "create_custom"
    case createPlaceholder = "create_placeholder"
    case createWithContent = "create_with_content"
}
