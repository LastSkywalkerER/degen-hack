part of 'observer_bloc.dart';

abstract class ObserverEvent {}

class HandleConnectionProposal implements ObserverEvent {}

class HandleSessionEvent implements ObserverEvent {}
