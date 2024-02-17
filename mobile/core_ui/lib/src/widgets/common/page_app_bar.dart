import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../../../core_ui.dart';

class PageAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isNeedDefaultLeading;

  final Widget? leading;
  final List<Widget>? trailingWidget;

  const PageAppBar({
    required this.title,
    this.leading,
    this.trailingWidget,
    this.isNeedDefaultLeading = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.orange,
      leading: leading ??
          (isNeedDefaultLeading
              ? Padding(
                  padding: const EdgeInsets.only(left: AppDimensions.padding16),
                  child: IconButton(
                    splashColor: AppColors.transparent,
                    highlightColor: AppColors.transparent,
                    onPressed: () {
                      appLocator<AppRouter>().pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: AppColors.white,
                  ),
                )
              : const SizedBox.shrink()),
      title: Text(
        title,
        style: AppFonts.semiBold20dmsSans.copyWith(color: AppColors.white),
      ),
      actions: trailingWidget ?? <Widget>[],
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, AppDimensions.size60);
}
