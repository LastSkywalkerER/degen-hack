import 'package:get_it/get_it.dart';

import '../config/app_config.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  void setupPreAuth() {
    appLocator.registerSingleton<AppConfig>(
      AppConfig.from(),
    );
  }

  void setupPostAuth() {}
}
