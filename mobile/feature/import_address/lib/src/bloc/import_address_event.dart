part of 'import_address_bloc.dart';

abstract class ImportAddressEvent {}

class ValidateAddressEvent extends ImportAddressEvent {
  final String seedPhrase;

  ValidateAddressEvent({
    required this.seedPhrase,
  });
}
