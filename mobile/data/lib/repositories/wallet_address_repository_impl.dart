part of repositories;

class WalletAddressRepositoryImpl implements domain.WalletAddressRepository {
  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  Future<domain.Wallet?> createWallet(String mnemonic) async {
    if (!bip39.validateMnemonic(mnemonic)) {
      return null;
    }

    return await _createWallet(mnemonic);
  }

  Future<domain.Wallet?> _createWallet(
    String mnemonic,
  ) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    final privateKeyObject = EthPrivateKey.fromHex(privateKey);
    final address = privateKeyObject.address;

    return domain.Wallet(
      address: address.hex,
      privateKey: privateKey,
    );
  }
}
