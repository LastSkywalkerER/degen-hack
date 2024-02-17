part of app_bottom_bar;

class BottomBarSelectorWidget extends StatelessWidget {
  final int itemsCount;
  final double itemWidth;
  final double itemHeight;
  final int selectedIndex;
  final Color activeColor;

  const BottomBarSelectorWidget({
    required this.itemWidth,
    required this.itemHeight,
    required this.itemsCount,
    required this.selectedIndex,
    Key? key,
    required this.activeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double selectorWidth = itemWidth / 4;
    const Duration duration = Duration(milliseconds: 150);
    return Positioned(
      top: AppDimensions.padding0,
      width: itemWidth,
      child: AnimatedAlign(
        alignment: Alignment(_getIndicatorPosition(selectedIndex, itemsCount) ?? 0, 0),
        duration: duration,
        child: SizedBox(
          width: itemWidth / itemsCount,
          height: itemHeight,
          child: Row(
            children: <Widget>[
              SizedBox(width: selectorWidth / 4),
              Container(
                width: selectorWidth / 2,
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(AppDimensions.radius16),
                    bottomRight: Radius.circular(AppDimensions.radius16),
                  ),
                ),
              ),
              SizedBox(width: selectorWidth / 4),
            ],
          ),
        ),
      ),
    );
  }

  double? _getIndicatorPosition(int index, int itemsCount) {
    return lerpDouble(-1.0, 1.0, index / (itemsCount - 1));
  }
}
