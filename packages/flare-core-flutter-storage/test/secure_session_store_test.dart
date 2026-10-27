import 'dart:async';
import 'dart:convert';
import 'package:flare_core_flutter_storage/flare_core_flutter_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  const channel = MethodChannel('plugins.it_nomads.com/flutter_secure_storage');
  const key = 'session.v2';
  const legacy = 'session.v1';
  late Map<String, String> encrypted;
  late SharedPreferences prefs;
  late MobileCredentialStore store;
  String? fail;
  Completer<void>? hold;
  setUp(() async {
    encrypted = {};
    fail = null;
    hold = null;
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
    store = MobileCredentialStore(
      preferences: prefs,
      binding: 'tenant/device',
      key: key,
      legacyKey: legacy,
    );
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == fail) {
            throw PlatformException(code: 'VAULT_UNAVAILABLE');
          }
          final args = call.arguments as Map;
          switch (call.method) {
            case 'read':
              return encrypted[args['key']];
            case 'write':
              await hold?.future;
              encrypted[args['key'] as String] = args['value'] as String;
              return null;
            case 'delete':
              encrypted.remove(args['key']);
              return null;
            default:
              throw StateError('unexpected vault operation');
          }
        });
  });
  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });
  test(
    'legacy moves to the OS vault exactly once and plaintext is removed',
    () async {
      await prefs.setString(legacy, 'old-credential');
      expect(await store.read(), 'old-credential');
      expect(prefs.containsKey(legacy), false);
      expect(jsonDecode(encrypted[key]!)['binding'], 'tenant/device');
      await prefs.setString(legacy, 'stale-credential');
      expect(await store.read(), 'old-credential');
      expect(prefs.containsKey(legacy), false);
    },
  );
  test(
    'failed migration blocks replay and removes plaintext without fallback',
    () async {
      await prefs.setString(legacy, 'old-credential');
      fail = 'write';
      await expectLater(store.read(), throwsA(isA<PlatformException>()));
      expect(prefs.containsKey(legacy), false);
      expect(prefs.getBool('$key.blocked'), true);
      fail = null;
      expect(await store.read(), null);
    },
  );
  test('vault read failure never falls back to legacy credentials', () async {
    await prefs.setString(legacy, 'old-credential');
    fail = 'read';
    await expectLater(store.read(), throwsA(isA<PlatformException>()));
    expect(prefs.containsKey(legacy), false);
    expect(prefs.getBool('$key.blocked'), true);
  });
  test(
    'tenant or installation mismatch and future schema fail closed',
    () async {
      for (final record in [
        {'version': 2, 'binding': 'other/device', 'value': 'credential'},
        {'version': 3, 'binding': 'tenant/device', 'value': 'credential'},
      ]) {
        await prefs.setBool('$key.blocked', false);
        encrypted[key] = jsonEncode(record);
        expect(await store.read(), null);
        expect(encrypted.containsKey(key), false);
      }
    },
  );
  test(
    'an old encrypted value cannot replay after an interrupted asynchronous write',
    () async {
      await store.write('old-credential');
      final old = encrypted[key]!;
      await store.write('rotated-credential');
      encrypted[key] =
          old; // OS write cache lost the latest ciphertext on process death.
      expect(await store.read(), null);
      expect(prefs.getBool('$key.blocked'), true);
    },
  );
  test(
    'vault loss cannot reactivate an obsolete plaintext preference',
    () async {
      await store.write('rotated-credential');
      encrypted.clear();
      await prefs.setString(legacy, 'old-credential');
      expect(await store.read(), null);
      expect(prefs.containsKey(legacy), false);
    },
  );
  test(
    'another reader waits for a rotating write instead of erasing it',
    () async {
      hold = Completer<void>();
      final writer = store.write('rotated');
      final second = MobileCredentialStore(
        preferences: prefs,
        binding: 'tenant/device',
        key: key,
        legacyKey: legacy,
      );
      final read = second.read();
      hold!.complete();
      await writer;
      expect(await read, 'rotated');
      expect(prefs.getBool('$key.blocked'), false);
    },
  );
  test(
    'clear waits for pending save and cannot resurrect a credential',
    () async {
      hold = Completer<void>();
      final write = store.write('rotated');
      final clear = store.clear();
      hold!.complete();
      await Future.wait([write, clear]);
      expect(await store.read(), null);
      expect(encrypted.containsKey(key), false);
    },
  );
  test('blocked tombstone survives an OS delete failure', () async {
    await store.write('credential');
    fail = 'delete';
    await expectLater(store.clear(), throwsA(isA<PlatformException>()));
    expect(prefs.getBool('$key.blocked'), true);
    fail = null;
    expect(await store.read(), null);
  });
}
