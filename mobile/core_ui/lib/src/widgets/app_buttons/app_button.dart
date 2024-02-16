part of widgets;

enum AppButtonStyle { primary, elevated, secondary, text, link }

class AppButton extends StatelessWidget {
  final AppButtonStyle style;
  final String? title;
  final String? iconPath;
  final bool isDisabled;
  final double? iconPadding;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? buttonHeight;
  final double? buttonWidth;
  final MainAxisSize? mainAxisSize;
  final OutlinedBorder? shape;
  final EdgeInsets? padding;

  const AppButton.primary({
    this.title,
    this.iconPath,
    this.mainAxisSize,
    required this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.borderColor,
    this.buttonHeight,
    this.buttonWidth,
    this.iconPadding,
    this.isDisabled = false,
    this.shape,
    this.padding,
  }) : style = AppButtonStyle.primary;

  const AppButton.elevated({
    this.shape,
    this.title,
    this.iconPath,
    this.mainAxisSize,
    required this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.buttonHeight,
    this.buttonWidth,
    this.borderColor,
    this.iconPadding,
    this.isDisabled = false,
    this.padding,
  }) : style = AppButtonStyle.elevated;

  @override
  Widget build(BuildContext context) {
    final String? iconPath = this.iconPath;
    final String? title = this.title;
    final double height = buttonHeight ?? AppDimensions.size50;
    final double? width = buttonWidth;
    final MainAxisSize mainAxisSize = this.mainAxisSize ?? MainAxisSize.max;
    final AppColorsTheme appColors = AppColorsTheme.of(context);
    final ButtonStyle buttonStyle = style == AppButtonStyle.elevated
        ? ElevatedButton.styleFrom(
            foregroundColor: foregroundColor ?? appColors.black,
            backgroundColor: backgroundColor ?? appColors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimensions.radius8,
              ),
            ),
          )
        : style == AppButtonStyle.secondary
            ? OutlinedButton.styleFrom(
                side: BorderSide(
                  color: borderColor ?? appColors.green,
                ),
                foregroundColor: foregroundColor ?? appColors.green,
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.radius8,
                  ),
                ),
              )
            : TextButton.styleFrom(
                shape: shape,
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor ?? appColors.green,
                padding: padding,
              );

    final Widget child = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        if (iconPath != null)
          Builder(
            builder: (BuildContext context) {
              return SvgPicture.asset(
                iconPath,
                width: AppDimensions.iconSize20,
                height: AppDimensions.iconSize20,
              );
            },
          ),
        if (iconPath != null && title != null)
          SizedBox(width: iconPadding ?? AppDimensions.padding8),
        if (title != null)
          Text(title,
              style: AppFonts.regular16dmsSans.copyWith(
                color: foregroundColor ??
                    (style == AppButtonStyle.primary ? appColors.black : appColors.green),
              )),
      ],
    );

    switch (style) {
      case AppButtonStyle.primary:
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppDimensions.radius10),
            gradient: LinearGradient(
              colors: isDisabled
                  ? <Color>[
                      appColors.green.withOpacity(.5),
                      appColors.lightBlue.withOpacity(.5),
                    ]
                  : <Color>[
                      appColors.green,
                      appColors.lightBlue,
                    ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: ElevatedButton(
            onPressed: isDisabled ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: child,
          ),
        );
      case AppButtonStyle.elevated:
        return SizedBox(
          height: height,
          child: ElevatedButton(
            style: buttonStyle,
            onPressed: isDisabled ? null : onPressed,
            child: child,
          ),
        );
      case AppButtonStyle.secondary:
        return SizedBox(
          height: height,
          child: OutlinedButton(
            style: buttonStyle,
            onPressed: isDisabled ? null : onPressed,
            child: child,
          ),
        );
      case AppButtonStyle.text:
        return TextButton(
          style: buttonStyle,
          onPressed: isDisabled ? null : onPressed,
          child: child,
        );
      case AppButtonStyle.link:
        return LinkButton(
          onPressed: isDisabled ? null : onPressed,
          child: child,
        );
    }
  }
}
