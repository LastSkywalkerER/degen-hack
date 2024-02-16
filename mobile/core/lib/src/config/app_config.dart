import '../../core.dart';

enum Flavor {
  prod,
  stage,
  dev,
}

class AppConfig {
  final Flavor flavor;
  final String sentryKey;
  final String graphQlBaseUrl;
  final String walletConnectId;
  final String vitreusBaseUrlWS;

  final String vitreusBaseUrlHTTP;
  final String onfidoDevUrl;
  final String explorerUrl;
  final String webSocketUrl;

  const AppConfig({
    required this.flavor,
    required this.sentryKey,
    required this.graphQlBaseUrl,
    required this.walletConnectId,
    required this.vitreusBaseUrlWS,
    required this.vitreusBaseUrlHTTP,
    required this.onfidoDevUrl,
    required this.explorerUrl,
    required this.webSocketUrl,
  });

  factory AppConfig.from() {
    String sentryKey;
    String walletConnectId;
    String graphQlBaseUrl;
    String vitreusBaseUrlWS;
    String vitreusBaseUrlHTTP;
    String onfidoDevUrl;
    String explorerUrl;
    String webSocketUrl;

    sentryKey = ApiConstants.prodSentryKey;
    graphQlBaseUrl = ApiConstants.graphProdUrl;
    vitreusBaseUrlWS = ApiConstants.vitreusProdUrlWs;
    vitreusBaseUrlHTTP = ApiConstants.vitreusProdHttpUrl;
    onfidoDevUrl = ApiConstants.onfidoDevUrl;
    walletConnectId = WalletConnectConstants.projectIdProd;
    explorerUrl = ApiConstants.explorerProdUrl;
    webSocketUrl = ApiConstants.webSocketProdUrl;

    return AppConfig(
      flavor: Flavor.prod,
      sentryKey: sentryKey,
      graphQlBaseUrl: graphQlBaseUrl,
      walletConnectId: walletConnectId,
      vitreusBaseUrlWS: vitreusBaseUrlWS,
      vitreusBaseUrlHTTP: vitreusBaseUrlHTTP,
      onfidoDevUrl: onfidoDevUrl,
      explorerUrl: explorerUrl,
      webSocketUrl: webSocketUrl,
    );
  }
}
