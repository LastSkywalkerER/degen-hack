import 'package:core/core.dart';

import '../errors/error_handler.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initApi();
  }

  void _initApi() {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );
  }
}
