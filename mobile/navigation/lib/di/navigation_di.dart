import 'package:core/core.dart';

import '../app_router/app_router.dart';

class NavigationDI {
  static void setupDependencies() {
    appLocator.registerSingleton(AppRouter());
  }
}
