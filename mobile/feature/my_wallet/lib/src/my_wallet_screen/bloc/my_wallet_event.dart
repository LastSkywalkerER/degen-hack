part of 'my_wallet_bloc.dart';

abstract class WelcomeEvent {}

class CreateNewAddress implements WelcomeEvent {}

class ImportAddress implements WelcomeEvent {}
