part of providers;

class SecureStorageProvider {
  late final FlutterSecureStorage _storage = const FlutterSecureStorage();

  SecureStorageProvider();

  Future<String?> readByKey({
    required String key,
  }) async {
    return _storage.read(
      key: key,
      iOptions: IOSOptions.defaultOptions,
      aOptions: _getAndroidOptions(),
    );
  }

  Future<void> deleteAll() async {
    return _storage.deleteAll();
  }

  Future<void> writeKey({
    required String key,
    required String value,
  }) async {
    return _storage.write(
      key: key,
      value: value,
      iOptions: IOSOptions.defaultOptions,
      aOptions: _getAndroidOptions(),
    );
  }

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
}
