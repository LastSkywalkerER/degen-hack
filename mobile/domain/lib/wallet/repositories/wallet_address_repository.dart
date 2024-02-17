part of '../wallet.dart';

abstract class WalletAddressRepository {
  String generateMnemonic(); // Method for generating a mnemonic phrase.
  Future<Wallet?> createWallet(String mnemonic); // Create wallet by mnemonic phrase.
  Future<bool> hasActiveWallet();
  Future<Wallet> getUserWallet();
}
