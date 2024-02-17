import 'package:core/core.dart';
import 'package:domain/wallet/wallet.dart';

import '../errors/error_handler.dart';
import '../providers/interceptors/dio_config.dart';
import '../providers/interceptors/http_api_client.dart';
import '../providers/node_http_api_provider.dart';
import '../providers/providers.dart';
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

    appLocator.registerLazySingleton<SecureStorageProvider>(
      SecureStorageProvider.new,
    );

    appLocator.registerSingletonAsync<SharedPreferencesProvider>(
      () async {
        final SharedPreferencesProvider sharedPreferencesProvider = SharedPreferencesProvider();
        await sharedPreferencesProvider.initializeSharedPreferences();

        return sharedPreferencesProvider;
      },
    );

    appLocator.registerLazySingleton<HttpDioClient>(
      () => HttpDioClient(
        appConfig: appLocator<AppConfig>(),
      ),
    );

    appLocator.registerLazySingleton<HttpApiClient>(
      () => HttpApiClient(
        dioClient: appLocator<HttpDioClient>().dio,
      ),
    );

    appLocator.registerLazySingleton<NodeHttpApiProvider>(
      () => NodeHttpApiProvider(
        httpApiClient: appLocator<HttpApiClient>(),
      ),
    );

    appLocator.registerLazySingleton<WalletAddressRepository>(
      () => WalletAddressRepositoryImpl(
        secureStorageProvider: appLocator.get<SecureStorageProvider>(),
        sharedPreferencesProvider: appLocator.get<SharedPreferencesProvider>(),
        nodeHttpApiProvider: appLocator.get<NodeHttpApiProvider>(),
      ),
    );

    //#region Usecases
    appLocator.registerLazySingleton<CreateWalletUseCase>(
      () => CreateWalletUseCase(
        walletAddressRepository: appLocator.get<WalletAddressRepository>(),
      ),
    );

    appLocator.registerLazySingleton<GenerateNewMnemonicUseCase>(
      () => GenerateNewMnemonicUseCase(
        walletAddressRepository: appLocator.get<WalletAddressRepository>(),
      ),
    );
  }
}
