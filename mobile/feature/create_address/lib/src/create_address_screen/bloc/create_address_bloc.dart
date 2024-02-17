import 'dart:async';

import 'package:core/core.dart';
import 'package:navigation/app_router/app_router.dart';

part 'create_address_event.dart';
part 'create_address_state.dart';

class CreateAddressBloc extends Bloc<CreateAddressEvent, WelcomeState> {
  final AppRouter _appRouter;

  CreateAddressBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(ContentState()) {
    on<NextClick>(_onCreateNewAddress);
  }

  Future<void> _onCreateNewAddress(
    NextClick event,
    Emitter<WelcomeState> emit,
  ) async {
    unawaited(_appRouter.push(const HomeRoute()));
  }
}
