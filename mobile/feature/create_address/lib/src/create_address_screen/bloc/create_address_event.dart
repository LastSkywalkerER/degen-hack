part of 'create_address_bloc.dart';

abstract class CreateAddressEvent {}

class NextClick implements CreateAddressEvent {}

class ImportAddress implements CreateAddressEvent {}
