part of providers;

class SharedPreferencesProvider {
  late final SharedPreferences _sharedPreferences;

  SharedPreferencesProvider();

  Future<void> initializeSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setIsOnboardingPassed(bool isPassed) async {
    await _sharedPreferences.setBool(
      SharedPreferencesKeys.isOnboardingPassedKey,
      isPassed,
    );
  }

  Future<bool> setAuthorized() async {
    return _sharedPreferences.setBool(SharedPreferencesKeys.isAuthorizedKey, true);
  }

  bool isAuthorized() {
    return _sharedPreferences.getBool(
          SharedPreferencesKeys.isAuthorizedKey,
        ) ??
        false;
  }

  bool? get getLocalAuthStatus {
    return _sharedPreferences.getBool(
      SharedPreferencesKeys.isLocalAuthEnabledKey,
    );
  }

  Future<void> saveLocalAuthStatus({required bool isLocalAuthEnabled}) async {
    await _sharedPreferences.setBool(
      SharedPreferencesKeys.isLocalAuthEnabledKey,
      isLocalAuthEnabled,
    );
  }

  Future<bool?> clearAll() async {
    return _sharedPreferences.clear();
  }
}
