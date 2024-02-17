import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/wallet/wallet.dart';
import 'package:navigation/app_router/app_router.dart';

part 'welcome_event.dart';
part 'welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AppRouter _appRouter;
  final CreateWalletUseCase _createWalletUseCase;
  final GenerateNewMnemonicUseCase _generateNewMnemonicUseCase;

  WelcomeBloc({
    required AppRouter appRouter,
    required CreateWalletUseCase createWalletUseCase,
    required GenerateNewMnemonicUseCase generateNewMnemonicUseCase,
  })  : _appRouter = appRouter,
        _createWalletUseCase = createWalletUseCase,
        _generateNewMnemonicUseCase = generateNewMnemonicUseCase,
        super(ContentState()) {
    on<ImportAddress>(_onImportAddress);
    on<CreateNewAddress>(_onCreateNewAddress);
  }

  Future<void> _onCreateNewAddress(
    CreateNewAddress event,
    Emitter<WelcomeState> emit,
  ) async {
    unawaited(_appRouter.push(const CreateAddressRoute()));
  }

  Future<void> _onImportAddress(
    ImportAddress event,
    Emitter<WelcomeState> emit,
  ) async {
    unawaited(_appRouter.push(const ImportAddressRoute()));
  }
}
