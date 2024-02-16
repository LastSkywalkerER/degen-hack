part of localization;

class AppLocalization {
  static const String localizationFilesPath = 'core/resources/langs';

  static List<Locale> get supportedLocales => <Locale>[_enLocale];

  static Locale get fallbackLocale => _enLocale;

  static const Locale _enLocale = Locale('en', 'US');

  static String translate(
    BuildContext context,
    String? key, {
    List<String>? args,
    Map<String, String>? namedArgs,
    String? gender,
  }) {
    if (key == null) return '';

    context.locale;

    return key.tr(
      args: args,
      namedArgs: namedArgs,
      gender: gender,
    );
  }
}
