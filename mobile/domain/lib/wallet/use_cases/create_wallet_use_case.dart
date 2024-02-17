part of '../wallet.dart';

class CreateWalletUseCase extends FutureUseCase<String, Wallet?> {
  final WalletAddressRepository _walletAddressRepository;

  CreateWalletUseCase({
    required WalletAddressRepository walletAddressRepository,
  }) : _walletAddressRepository = walletAddressRepository;

  @override
  Future<Wallet?> execute(String input) {
    return _walletAddressRepository.createWallet(input);
  }
}
