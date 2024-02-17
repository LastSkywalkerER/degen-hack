import 'dart:async';

import 'package:core/core.dart';
import 'package:navigation/app_router/app_router.dart';

part 'info_event.dart';
part 'info_state.dart';

class InfoBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AppRouter _appRouter;

  InfoBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(ContentState()) {
    on<ImportAddress>(_onImportAddress);
    on<CreateNewAddress>(_onCreateNewAddress);
    print("Hello");
  }

  Future<void> _onCreateNewAddress(
    CreateNewAddress event,
    Emitter<WelcomeState> emit,
  ) async {
    //unawaited(_appRouter.push(const CreateAddressRoute()));
  }

  Future<void> _onImportAddress(
    ImportAddress event,
    Emitter<WelcomeState> emit,
  ) async {
    unawaited(_appRouter.push(const ImportAddressRoute()));
  }
}
