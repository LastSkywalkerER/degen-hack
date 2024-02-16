import 'package:get_it/get_it.dart';

import '../config/app_config.dart';

final AppDI appDI = AppDI();
final GetIt appLocator = GetIt.instance;

class AppDI {
  void setupPreAuth({
    required Flavor flavor,
  }) {
    appLocator.registerSingleton<AppConfig>(
      AppConfig.fromFlavor(flavor),
    );
  }

  void setupPostAuth() {}
}
