import 'package:auto_route/src/route/page_route_info.dart';
import 'package:core/core.dart';
import 'package:domain/wallet/wallet.dart';
import 'package:navigation/app_router/app_router.dart';

part 'import_address_event.dart';
part 'import_address_state.dart';

class ImportAddressBloc extends Bloc<ImportAddressEvent, ImportAddressState> {
  final AppRouter _appRouter;
  final CreateWalletUseCase _createWalletUseCase;

  ImportAddressBloc({
    required CreateWalletUseCase createWalletUseCase,
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        _createWalletUseCase = createWalletUseCase,
        super(ContentState()) {
    on<ValidateAddressEvent>(_onValidateAddress);
  }

  Future<void> _onValidateAddress(
    ValidateAddressEvent event,
    Emitter<ImportAddressState> emit,
  ) async {
    try {
      final Wallet? wallet = await _createWalletUseCase.execute(event.seedPhrase);
      if (wallet == null) {
        final Map<String, String?> errors = <String, String?>{};
        errors['seedPhrase'] = "Wrong seed phrase";
      } else {
        await _appRouter.replaceAll(<PageRouteInfo>[const HomeRoute()]);
      }
    } catch (error) {
      emit(
        ContentState(
          errors: <String, String?>{'seedPhrase': error.toString()},
        ),
      );
    }
  }
}
