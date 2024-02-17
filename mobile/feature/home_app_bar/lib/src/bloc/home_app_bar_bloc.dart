import 'dart:async';

import 'package:core/core.dart';
import 'package:navigation/app_router/app_router.dart';

part 'home_app_bar_event.dart';
part 'home_app_bar_state.dart';

class HomeAppBarBloc extends Bloc<HomeAppBarEvent, HomeAppBarState> {
  final AppRouter _appRouter;

  String? walletAddress;
  bool isNacMinted = false;

  HomeAppBarBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(HomeAppBarState()) {
    on<LoadInitialData>(_onLoadData);
    on<OpenUserSettings>(_onOpenUserSettings);
  }

  Future<void> _onLoadData(
    LoadInitialData event,
    Emitter<HomeAppBarState> emit,
  ) async {
    // final Wallet wallet = await _getUserWalletUseCase.execute(const NoParams());
    // walletAddress = wallet.address;
    // walletInfoModel = await _getWalletInfoUseCase.execute(wallet.address);
  }

  Future<void> _onOpenUserSettings(
    OpenUserSettings event,
    Emitter<HomeAppBarState> emit,
  ) async {
    // unawaited(appLocator<AppRouter>().push(const SettingsRoute()));
  }
}
