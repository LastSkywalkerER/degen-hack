part of 'create_address_bloc.dart';

abstract class WelcomeEvent {}

class CreateNewAddress implements WelcomeEvent {}

class ImportAddress implements WelcomeEvent {}
