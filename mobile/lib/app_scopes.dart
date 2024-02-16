import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:navigation/di/navigation_di.dart';

class AppScopes {
  static const String _defaultScope = 'defaultScope';

  static Future<void> get whenScopeReady => appLocator.allReady();

  static void pushDefaultScope({
    required Flavor flavor,
  }) {
    appLocator.pushNewScope(
      scopeName: _defaultScope,
      init: (_) {
        appDI.setupPreAuth();
        dataDI.initDependencies();
        NavigationDI.setupDependencies();
      },
    );
  }
}
