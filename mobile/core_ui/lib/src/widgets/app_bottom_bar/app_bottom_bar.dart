part of app_bottom_bar;

class AppBottomBar extends StatefulWidget {
  final double barHeight;
  final Color inactiveColor;
  final double cornerRadius;
  final int selectedIndex;
  final TextStyle textStyle;
  final Color activeColor;
  final Color backgroundColor;
  final double indicatorHeight;
  final ValueChanged<int> onTap;
  final List<NavigationBarItemModel> items;

  const AppBottomBar({
    Key? key,
    this.barHeight = 66,
    required this.backgroundColor,
    this.selectedIndex = 0,
    this.cornerRadius = 20,
    required this.textStyle,
    required this.activeColor,
    this.indicatorHeight = 3,
    required this.onTap,
    required this.items,
    required this.inactiveColor,
  }) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int selectedIndex = 0;
  Duration duration = const Duration(milliseconds: 150);

  @override
  Widget build(BuildContext context) {
    final double workAreaWidth = MediaQuery.of(context).size.width - AppDimensions.size44;
    final double elementWidth = workAreaWidth / widget.items.length;
    final double safeAreaPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      height: widget.barHeight + safeAreaPadding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(widget.cornerRadius),
          topRight: Radius.circular(widget.cornerRadius),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: widget.indicatorHeight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: widget.items.map(
                (NavigationBarItemModel item) {
                  final int index = widget.items.indexOf(item);
                  return BottomBatItem(
                    itemWidth: elementWidth,
                    item: widget.items[index],
                    isActive: index == widget.selectedIndex,
                    itemsCount: widget.items.length,
                    activeColor: widget.activeColor,
                    inactiveColor: widget.inactiveColor,
                    textStyle: widget.textStyle,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      widget.onTap(selectedIndex);
                    },
                  );
                },
              ).toList(),
            ),
          ),
          BottomBarSelectorWidget(
            itemWidth: workAreaWidth,
            itemHeight: widget.indicatorHeight,
            itemsCount: widget.items.length,
            selectedIndex: widget.selectedIndex,
            activeColor: widget.activeColor,
          ),
        ],
      ),
    );
  }
}
