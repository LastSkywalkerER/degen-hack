part of app_bottom_bar;

class BottomBatItem extends StatelessWidget {
  final int itemsCount;
  final bool isActive;
  final Color activeColor;
  final Color inactiveColor;
  final TextStyle textStyle;
  final Function() onTap;
  final NavigationBarItemModel item;
  final double itemWidth;

  const BottomBatItem({
    Key? key,
    required this.item,
    required this.isActive,
    required this.itemsCount,
    required this.activeColor,
    required this.inactiveColor,
    required this.textStyle,
    required this.onTap,
    required this.itemWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: itemWidth,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: AppDimensions.padding14),
            Icon(
              item.icon,
              color: isActive ? activeColor : inactiveColor,
            ),
          ],
        ),
      ),
    );
  }
}
