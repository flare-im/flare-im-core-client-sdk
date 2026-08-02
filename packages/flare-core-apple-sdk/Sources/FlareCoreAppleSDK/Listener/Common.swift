import Foundation

/// GENERATED. Do not edit by hand.
public typealias EventCallback<T> = @Sendable (T) -> Void

public protocol EventSubscription: AnyObject {
    var id: String { get }
    func unsubscribe()
}
