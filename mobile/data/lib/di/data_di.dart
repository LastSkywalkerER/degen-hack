import 'package:core/core.dart';

import '../errors/error_handler.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies({
    required Flavor flavor,
  }) {
    _initApi(flavor);
  }

  void _initApi(Flavor flavor) {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );
  }
}
