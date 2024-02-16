part of core_ui;

abstract class AppColorsTheme {
  factory AppColorsTheme.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  Color get primaryBg;

  Color get shadesBlack;

  Color get shadesGray;

  Color get loaderColor;

  Color get secondaryTextColor;

  Color get secondaryBackgroundColor;

  Color get white;

  Color get green;

  Color get lightBlue;

  Color get black;

  Color get aztec2;

  Color get inputHintColor;

  Color get disabledSwitcherColor;

  Color get chipBackgroundColor;

  Color get disabledCheckBoxBorder;

  Color get errorColor;

  Color get errorBgColor;

  Color get infoContainerBg;

  Color get syncingBg;

  Color get bottomBarColor;

  Color get walletTransactionsSection;

  Color get sendTransAccentColor;

  Color get signTransDialogBg;

  Color get resetColor;

  Color get dividerColor;

  Color get disableButtonColor;

  Color get grayText;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors implements AppColorsTheme {
  const LightColors();

  @override
  Color get primaryBg => AppColors.bunker;

  @override
  Color get aztec2 => AppColors.aztec2;

  @override
  Color get shadesBlack => AppColors.tePapaGreen;

  @override
  Color get shadesGray => AppColors.shadesGray;

  @override
  Color get white => AppColors.white;

  @override
  Color get green => AppColors.spray;

  @override
  Color get black => AppColors.black;

  @override
  Color get lightBlue => AppColors.brightTurquoise;

  @override
  Color get secondaryTextColor => AppColors.sirocco;

  @override
  Color get secondaryBackgroundColor => AppColors.aztec;

  @override
  Color get inputHintColor => AppColors.cuttySark;

  @override
  Color get disabledSwitcherColor => AppColors.mineralGreen;

  @override
  Color get chipBackgroundColor => AppColors.mediumJungleGreen;

  @override
  Color get disabledCheckBoxBorder => AppColors.gunMetal;

  @override
  Color get errorColor => AppColors.flushMahogany;

  @override
  Color get infoContainerBg => AppColors.timberGreen;

  @override
  Color get syncingBg => AppColors.pullmanGreen;

  @override
  Color get bottomBarColor => AppColors.aztecSecondary;

  @override
  Color get errorBgColor => AppColors.cocoaBrown;

  @override
  Color get walletTransactionsSection => AppColors.siroccoSecondary;

  @override
  Color get sendTransAccentColor => AppColors.porcelain;

  @override
  Color get loaderColor => AppColors.spectra;

  @override
  Color get signTransDialogBg => AppColors.aztec3;

  @override
  Color get resetColor => AppColors.manz;

  @override
  Color get dividerColor => AppColors.tePapaGreen;

  @override
  Color get disableButtonColor => AppColors.corduroy;

  @override
  Color get grayText => AppColors.silverChalice;
}
