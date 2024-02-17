import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/home_app_bar_bloc.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeAppBarBloc>.value(
      value: BlocProvider.of<HomeAppBarBloc>(context),
      child: PageAppBar(
        title: title,
        leading: Row(
          children: <Widget>[
            const SizedBox(width: AppDimensions.padding24),
            // GestureDetector(
            //   onTap: () {
            //     context.read<HomeAppBarBloc>().add(OpenUserSettings());
            //   },
            //   child: SvgPicture.asset(AppIcons.profileIcon),
            // ),
          ],
        ),
        trailingWidget: <Widget>[
          // GestureDetector(
          //   onTap: () async {
          //     context.read<HomeAppBarBloc>().add(ScanQrCode());
          //   },
          //   child: SvgPicture.asset(
          //     AppIcons.qrScanIcon,
          //   ),
          // ),
          const SizedBox(width: AppDimensions.padding24),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, AppDimensions.size60);
}
