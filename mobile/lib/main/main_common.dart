import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../app_scopes.dart';
import '../mobile_app.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  AppScopes.pushDefaultScope(flavor: flavor);

  await EasyLocalization.ensureInitialized();

  await SentryFlutter.init(
    (SentryFlutterOptions options) {
      options.debug = true;
      options.attachScreenshot = true;
      options.dsn = AppConfig.fromFlavor(flavor).sentryKey;
      options.maxRequestBodySize = MaxRequestBodySize.always;
      options.maxResponseBodySize = MaxResponseBodySize.always;
    },
    appRunner: () => runApp(
      SentryScreenshotWidget(
        child: SentryUserInteractionWidget(
          child: DefaultAssetBundle(
            bundle: SentryAssetBundle(),
            child: EasyLocalization(
              supportedLocales: AppLocalization.supportedLocales,
              path: AppLocalization.localizationFilesPath,
              fallbackLocale: AppLocalization.fallbackLocale,
              useFallbackTranslations: true,
              saveLocale: false,
              child: const MobileApp(),
            ),
          ),
        ),
      ),
    ),
  );
}
