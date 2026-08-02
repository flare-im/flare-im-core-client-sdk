// GENERATED. Do not edit by hand.
export 'common.dart';
export 'capability.dart';
export 'connection.dart';
export 'conversation.dart';
export 'lifecycle.dart';
export 'media.dart';
export 'message.dart';
export 'sync.dart';
export 'view.dart';

import 'capability.dart';
import 'connection.dart';
import 'conversation.dart';
import 'lifecycle.dart';
import 'media.dart';
import 'message.dart';
import 'sync.dart';
import 'view.dart';

/// Optional callback surface for apps that prefer one listener object.
abstract class FlareImEventListener
    implements CapabilityEventListener, ConnectionEventListener, ConversationEventListener, LifecycleEventListener, MediaEventListener, MessageEventListener, SyncEventListener, ViewEventListener {
  const FlareImEventListener();
}
