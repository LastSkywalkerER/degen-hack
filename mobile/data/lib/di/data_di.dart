import 'package:core/core.dart';
import 'package:domain/wallet/wallet.dart';

import '../errors/error_handler.dart';
import '../repositories/repositories.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initApi();
  }

  void _initApi() {
    appLocator.registerLazySingleton<ErrorHandler>(
      ErrorHandler.new,
    );

    appLocator.registerLazySingleton<WalletAddressRepository>(
      () => WalletAddressRepositoryImpl(),
    );

    //#region Usecases
    appLocator.registerLazySingleton<CreateWalletUseCase>(
      () => CreateWalletUseCase(
        walletAddressRepository: appLocator.get<WalletAddressRepository>(),
      ),
    );
  }
}
