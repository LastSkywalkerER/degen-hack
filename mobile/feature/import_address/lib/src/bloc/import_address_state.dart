part of 'import_address_bloc.dart';

abstract class ImportAddressState {}

class ContentState implements ImportAddressState {
  final Map<String, String?>? errors;

  ContentState({this.errors});
}
