part of '../wallet.dart';

class GenerateNewMnemonicUseCase extends UseCase<NoParams, String> {
  final WalletAddressRepository _walletAddressRepository;

  GenerateNewMnemonicUseCase({
    required WalletAddressRepository walletAddressRepository,
  }) : _walletAddressRepository = walletAddressRepository;

  @override
  String execute(NoParams input) {
    return _walletAddressRepository.generateMnemonic();
  }
}
