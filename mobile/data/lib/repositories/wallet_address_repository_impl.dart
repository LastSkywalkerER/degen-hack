part of repositories;

class WalletAddressRepositoryImpl implements domain.WalletAddressRepository {
  final SecureStorageProvider _secureStorageProvider;
  final SharedPreferencesProvider _sharedPreferencesProvider;
  final NodeHttpApiProvider _nodeHttpApiProvider;

  WalletAddressRepositoryImpl({
    required SecureStorageProvider secureStorageProvider,
    required SharedPreferencesProvider sharedPreferencesProvider,
    required NodeHttpApiProvider nodeHttpApiProvider,
  })  : _secureStorageProvider = secureStorageProvider,
        _sharedPreferencesProvider = sharedPreferencesProvider,
        _nodeHttpApiProvider = nodeHttpApiProvider;

  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  Future<domain.Wallet?> createWallet(String mnemonic) async {
    if (!bip39.validateMnemonic(mnemonic)) {
      return null;
    }

    final wallet = await _createWallet(mnemonic);
    if (wallet != null) {
      await _secureStorageProvider.writeKey(
        key: StorageConstants.walletAddressKey,
        value: wallet.address,
      );
      await _secureStorageProvider.writeKey(
        key: StorageConstants.privateKey,
        value: wallet.privateKey,
      );

      return wallet;
    }

    return null;
  }

  Future<domain.Wallet?> _createWallet(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    final privateKeyObject = EthPrivateKey.fromHex(privateKey);
    final address = privateKeyObject.address;

    final response =
        await _nodeHttpApiProvider.login(payload: LoginPayload(address: address.toString()));
    final messageToSign = response.data['message'].toString();

    final private = EthPrivateKey.fromHex(privateKey);
    final sign = await private.signPersonalMessage(Uint8List.fromList(utf8.encode(messageToSign)));

    final responseTwo = await _nodeHttpApiProvider.verify(
      payload: VerifyPayload(address: address.toString(), signature: '0x${hex.encode(sign)}'),
    );

    final String success = responseTwo.data['success'].toString();
    final String accessToken = responseTwo.data['accessToken'].toString();
    final String refreshToken = responseTwo.data['refreshToken'].toString();

    return domain.Wallet(
      address: address.hex,
      privateKey: privateKey,
    );
  }

  @override
  Future<domain.Wallet> getUserWallet() {
    // TODO: implement getUserWallet
    throw UnimplementedError();
  }

  @override
  Future<bool> hasActiveWallet() async {
    final String? walletAddress = await _secureStorageProvider.readByKey(
      key: StorageConstants.walletAddressKey,
    );

    final String? privateKey = await _secureStorageProvider.readByKey(
      key: StorageConstants.privateKey,
    );

    return walletAddress != null && privateKey != null;
  }
}
