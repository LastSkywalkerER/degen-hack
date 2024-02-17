import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:home_app_bar/home_app_bar.dart';
import 'package:info/info.dart';
import 'package:my_strategies/my_strategies.dart';
import 'package:my_wallet/my_wallet.dart';
import 'package:navigation/app_router/app_router.dart';
import 'package:public_strategies/public_strategies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<HomeAppBarBloc>(
          lazy: false,
          create: (BuildContext context) {
            return HomeAppBarBloc(
              appRouter: appLocator<AppRouter>(),
            );
          },
        ),
        BlocProvider<InfoBloc>(
          lazy: false,
          create: (BuildContext context) {
            return InfoBloc(
              appRouter: appLocator<AppRouter>(),
            );
          },
        ),
        BlocProvider<MyStrategiesBloc>(
          lazy: false,
          create: (BuildContext context) {
            return MyStrategiesBloc(
              appRouter: appLocator<AppRouter>(),
            );
          },
        ),
        BlocProvider<MyWalletBloc>(
          lazy: false,
          create: (BuildContext context) {
            return MyWalletBloc(
              appRouter: appLocator<AppRouter>(),
            );
          },
        ),
        BlocProvider<PublicStrategiesBloc>(
          lazy: false,
          create: (BuildContext context) {
            return PublicStrategiesBloc(
              appRouter: appLocator<AppRouter>(),
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Color(0xFF21213B),
        body: getBody(),
        bottomNavigationBar: AppBottomBar(
          onTap: (int value) {
            setState(() {
              currentIndex = value;
            });
          },
          activeColor: Colors.white,
          textStyle: AppFonts.extraBold12Manrope,
          inactiveColor: Color(0xFF6c6e8a),
          backgroundColor: Color(0xFF171822),
          selectedIndex: currentIndex,
          items: <NavigationBarItemModel>[
            NavigationBarItemModel(
              icon: Icons.home,
              title: LocaleKeys.navBar_home.watchTr(context),
            ),
            NavigationBarItemModel(
              icon: Icons.query_stats,
              title: LocaleKeys.navBar_myStrategies.watchTr(context),
            ),
            NavigationBarItemModel(
              icon: Icons.safety_divider,
              title: LocaleKeys.navBar_publicStrategies.watchTr(context),
            ),
            NavigationBarItemModel(
              icon: Icons.account_balance_wallet,
              title: LocaleKeys.navBar_wallet.watchTr(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    print(currentIndex);

    switch (currentIndex) {
      case 0:
        return InfoScreen();
      case 1:
        return MyStrategiesScreen();
      case 2:
        return PublicStrategiesScreen();
      case 3:
        return MyWalletScreen();
      default:
        return const SizedBox.shrink();
    }
  }
}
