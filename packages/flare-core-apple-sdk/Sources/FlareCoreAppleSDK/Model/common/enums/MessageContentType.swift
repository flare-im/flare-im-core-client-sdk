import Foundation

/// GENERATED. Do not edit by hand.
/// Decoded message content discriminator.
public enum MessageContentType: String, Codable, Sendable {
    case text = "text"
    case image = "image"
    case video = "video"
    case audio = "audio"
    case file = "file"
    case location = "location"
    case card = "card"
    case sticker = "sticker"
    case emoji = "emoji"
    case quote = "quote"
    case linkCard = "link_card"
    case forward = "forward"
    case thread = "thread"
    case miniProgram = "mini_program"
    case richText = "rich_text"
    case imageGroup = "image_group"
    case system = "system"
    case notification = "notification"
    case vote = "vote"
    case task = "task"
    case schedule = "schedule"
    case announcement = "announcement"
    case custom = "custom"
    case placeholder = "placeholder"
}
