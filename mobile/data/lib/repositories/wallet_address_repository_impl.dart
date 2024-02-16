part of repositories;

class WalletAddressRepositoryImpl implements domain.WalletAddressRepository {
  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }
}
