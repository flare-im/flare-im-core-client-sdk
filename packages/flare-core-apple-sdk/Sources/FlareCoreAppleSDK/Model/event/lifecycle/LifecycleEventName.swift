import Foundation

/// GENERATED. Do not edit by hand.
/// Client SDK lifecycle notification name.
public enum LifecycleEventName: String, Codable, Sendable {
    case initializing = "initializing"
    case initialized = "initialized"
    case initFailed = "init_failed"
    case loginSucceeded = "login_succeeded"
    case loginFailed = "login_failed"
    case loggedOut = "logged_out"
    case disposed = "disposed"
}
