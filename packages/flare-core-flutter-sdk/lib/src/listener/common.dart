// GENERATED. Do not edit by hand.
/// Callback invoked for one typed SDK notification.
typedef EventCallback<T> = void Function(T event);

/// Disposable local listener registration returned by high-level `on*` APIs.
abstract interface class EventSubscription {
  Object get id;
  void unsubscribe();
}
