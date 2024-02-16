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

  factory AppConfig.fromFlavor(Flavor flavor) {
    String sentryKey;
    String walletConnectId;
    String graphQlBaseUrl;
    String vitreusBaseUrlWS;
    String vitreusBaseUrlHTTP;
    String onfidoDevUrl;
    String explorerUrl;
    String webSocketUrl;
    switch (flavor) {
      case Flavor.prod:
        sentryKey = ApiConstants.prodSentryKey;
        graphQlBaseUrl = ApiConstants.graphProdUrl;
        vitreusBaseUrlWS = ApiConstants.vitreusProdUrlWs;
        vitreusBaseUrlHTTP = ApiConstants.vitreusProdHttpUrl;
        onfidoDevUrl = ApiConstants.onfidoDevUrl;
        walletConnectId = WalletConnectConstants.projectIdProd;
        explorerUrl = ApiConstants.explorerProdUrl;
        webSocketUrl = ApiConstants.webSocketProdUrl;
        break;

      case Flavor.stage:
        sentryKey = ApiConstants.stageSentryKey;
        graphQlBaseUrl = ApiConstants.graphDevUrl;
        vitreusBaseUrlWS = ApiConstants.vitreusDevUrlWs;
        vitreusBaseUrlHTTP = ApiConstants.vitreusDevHttpUrl;
        onfidoDevUrl = ApiConstants.onfidoDevUrl;
        walletConnectId = WalletConnectConstants.projectIdDev;
        explorerUrl = ApiConstants.explorerDevUrl;
        webSocketUrl = ApiConstants.webSocketStageUrl;
        break;

      case Flavor.dev:
        sentryKey = ApiConstants.devSentryKey;
        graphQlBaseUrl = ApiConstants.graphDevUrl;
        vitreusBaseUrlWS = ApiConstants.vitreusDevUrlWs;
        vitreusBaseUrlHTTP = ApiConstants.vitreusDevHttpUrl;
        onfidoDevUrl = ApiConstants.onfidoDevUrl;
        walletConnectId = WalletConnectConstants.projectIdDev;
        explorerUrl = ApiConstants.explorerDevUrl;
        webSocketUrl = ApiConstants.webSocketDevUrl;
        break;
    }

    return AppConfig(
      flavor: flavor,
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
