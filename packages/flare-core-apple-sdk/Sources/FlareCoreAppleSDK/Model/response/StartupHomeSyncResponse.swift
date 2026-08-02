import Foundation

/// GENERATED. Do not edit by hand.
/// First usable home snapshot plus diagnostics about the startup sync path.
public struct StartupHomeSyncResponse: Codable, Sendable {
    /// wire: `backgroundConvergenceStarted`. 
    public let backgroundConvergenceStarted: Bool
    /// wire: `coldSyncPerformed`. 
    public let coldSyncPerformed: Bool
    /// wire: `degradedReason`. 
    public let degradedReason: String?
    /// wire: `servedFromLocal`. 
    public let servedFromLocal: Bool
    /// wire: `snapshot`. 
    public let snapshot: HomeTimelineSnapshot

    public init(backgroundConvergenceStarted: Bool = false, coldSyncPerformed: Bool = false, degradedReason: String? = nil, servedFromLocal: Bool = false, snapshot: HomeTimelineSnapshot) {
        self.backgroundConvergenceStarted = backgroundConvergenceStarted
        self.coldSyncPerformed = coldSyncPerformed
        self.degradedReason = degradedReason
        self.servedFromLocal = servedFromLocal
        self.snapshot = snapshot
    }
}
