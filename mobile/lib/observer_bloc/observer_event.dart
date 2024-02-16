part of 'observer_bloc.dart';

abstract class ObserverEvent {}

class HandleConnectionProposal implements ObserverEvent {
  final SessionProposal sessionProposal;

  HandleConnectionProposal({required this.sessionProposal});
}

class HandleSessionEvent implements ObserverEvent {
  final SessionRequest sessionRequest;

  HandleSessionEvent({required this.sessionRequest});
}
