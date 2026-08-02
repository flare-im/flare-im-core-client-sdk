// GENERATED. Do not edit by hand.
import 'modules/modules.dart';

typedef JsonObject = Map<String, Object?>;

/// Root SDK client. Create one instance per app/session boundary.
abstract interface class FlareImClient implements SessionApi {
  /// Connection state and manual network lifecycle.
  ConnectionApi get connection;
  /// Conversation query and local conversation state.
  ConversationsApi get conversations;
  /// Typed quick-build APIs for all supported message content kinds. Prefer these over raw JSON in adapters.
  MessageBuilderApi get messageBuilder;
  /// Message build, send, query and mutation.
  MessagesApi get messages;
  /// Explicit sync operations.
  SyncApi get sync;
  /// User profile cache (business-fed identity for messages and conversations).
  UserApi get user;
  /// Presence and input state.
  PresenceApi get presence;
  /// Media access URL and local cache operations.
  MediaApi get media;
  /// Capability discovery and optional plugin dispatch through capability dispatch ops.
  CapabilitiesApi get capabilities;
  /// Core observable message/conversation views.
  ViewsApi get views;
  /// Typed SDK event stream.
  EventsApi get events;
  /// SDK version and FFI contract diagnostics.
  DiagnosticsApi get diagnostics;
}
