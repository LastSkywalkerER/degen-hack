class WalletAddressUtils {
  static String hideAddress({
    required String? address,
    required int firstPartLength,
  }) {
    if (address == null) return '';

    final int secondPartStartIndex = address.length - 4;
    final String firstPart = address.substring(0, firstPartLength);
    final String secondPart = address.substring(secondPartStartIndex, address.length);

    return '$firstPart...$secondPart';
  }
}
