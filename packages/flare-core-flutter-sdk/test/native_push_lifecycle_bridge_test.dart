import 'dart:async';
import 'package:flare_core_flutter_sdk/flare_core_flutter_sdk.dart';
import 'package:test/test.dart';

void main() {
  test('OS token refresh and permission use canonical typed core operations',
      () async {
    final native = _Bridge();
    final client = FlareCoreSdk.createClientWithBridge(native);
    final lifecycle = NativePushLifecycleBridge(client);
    final status = await lifecycle.onTokenRefresh(const PushTokenInput(
      provider: 'fcm',
      platform: 'android',
      token: 'os-test-token',
    ));
    expect(native.calls.last.$1, 'sdk.update_push_token');
    expect(native.calls.last.$2, {
      'provider': 'fcm',
      'platform': 'android',
      'token': 'os-test-token',
    });
    expect(status.state, 'pending');
    expect(status.pendingRevocations, 1);
    await lifecycle.onPermissionChanged(false);
    expect(native.calls.last.$1, 'sdk.set_push_permission');
    expect(native.calls.last.$2, {'allowed': false});
    await lifecycle.onTokenInvalidated('fcm');
    expect(native.calls.last.$1, 'sdk.clear_push_token');
    expect(native.calls.last.$2, {'provider': 'fcm'});
  });

  test('revocation callback is not queued behind an unresolved token write',
      () async {
    final native = _Bridge()..tokenReply = Completer<Object?>();
    final lifecycle =
        NativePushLifecycleBridge(FlareCoreSdk.createClientWithBridge(native));
    final pending = lifecycle.onTokenRefresh(const PushTokenInput(
      provider: 'apns',
      platform: 'ios',
      token: 'aabb',
    ));
    await lifecycle.onPermissionChanged(false);
    expect(native.calls.map((c) => c.$1),
        ['sdk.update_push_token', 'sdk.set_push_permission']);
    native.tokenReply!.complete(_status());
    expect((await pending).state, 'pending');
  });

  test(
      'foreground and network callbacks reconcile; exit and switch stay on normal session APIs',
      () async {
    final native = _Bridge();
    final client = FlareCoreSdk.createClientWithBridge(native);
    final lifecycle = NativePushLifecycleBridge(client);
    await lifecycle.onResume();
    await lifecycle.onNetworkAvailable();
    await client.logout();
    await client.login({'userId': 'second-user', 'token': 'fixture-only'});
    await lifecycle.onTokenRefresh(const PushTokenInput(
        provider: 'fcm', platform: 'android', token: 'replacement'));
    expect(native.calls.map((c) => c.$1), [
      'sdk.reconcile_push',
      'sdk.reconcile_push',
      'sdk.logout',
      'sdk.login',
      'sdk.update_push_token',
    ]);
    expect(
        native.descriptors.where((d) => d.operation.contains('push')).every(
            (d) =>
                d.cApi == 'flare_sdk_invoke_json' &&
                d.transport == 'contract-invoke-json'),
        isTrue);
  });
}

Map<String, Object?> _status() => {
      'state': 'pending',
      'configuredProviders': 1,
      'registeredProviders': 0,
      'pendingRevocations': 1,
      'lastError': null,
    };

final class _Bridge implements NativeBridge {
  final calls = <(String, Object?)>[];
  final descriptors = <NativeCallDescriptor>[];
  Completer<Object?>? tokenReply;

  @override
  Future<T> invoke<T>(NativeCallDescriptor descriptor,
      [Object? request]) async {
    descriptors.add(descriptor);
    calls.add((descriptor.operation, request));
    if (descriptor.operation == 'sdk.update_push_token' && tokenReply != null) {
      return (await tokenReply!.future) as T;
    }
    if (descriptor.operation == 'sdk.login' ||
        descriptor.operation == 'sdk.logout') {
      return null as T;
    }
    return _status() as T;
  }
}
