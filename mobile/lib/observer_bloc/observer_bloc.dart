import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation/app_router/app_router.dart';

part 'observer_event.dart';
part 'observer_state.dart';

class ObserverBloc extends Bloc<ObserverEvent, ObserverState> {
  final AppRouter _appRouter;

  ObserverBloc({
    required AppRouter appRouter,
  })  : _appRouter = appRouter,
        super(ContentState()) {
    on<HandleSessionEvent>(_onHandleSessionEvent);
    on<HandleConnectionProposal>(_onHandleConnectionProposal);
  }

  //_onHandleSessionEvent
  Future<void> _onHandleSessionEvent(
    HandleSessionEvent event,
    Emitter<ObserverState> emit,
  ) async {}

  Future<void> _onHandleConnectionProposal(
    HandleConnectionProposal event,
    Emitter<ObserverState> emit,
  ) async {
    try {} catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
