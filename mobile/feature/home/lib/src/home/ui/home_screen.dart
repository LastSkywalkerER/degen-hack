import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List<BankListDataModel> bankDataList = [
    BankListDataModel("Sepolia",
        "https://www.kindpng.com/picc/m/83-837808_sbi-logo-state-bank-of-india-group-png.png"),
    BankListDataModel("Second network",
        "https://www.pngix.com/pngfile/big/12-123534_download-hdfc-bank-hd-png-download.png"),
  ];
  late BankListDataModel _bankChoose = bankDataList[0];

  @override
  void initState() {
    super.initState();
  }

  void _onDropDownItemSelected(BankListDataModel newSelectedBank) {
    setState(() {
      _bankChoose = newSelectedBank;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
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
        appBar: AppBar(
          backgroundColor: Color(0xFF171822),
          leading: Theme(
            data: Theme.of(context).copyWith(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
            ),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Обработчик нажатия
              },
            ),
          ),
          title: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: Padding(
              padding: EdgeInsets.only(right: 40),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<BankListDataModel>(
                  dropdownColor: Color(0xFF171822), // Темный цвет фона выпадающего списка
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                  hint: Text(
                    "Select Bank",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: "verdana_regular",
                    ),
                  ),
                  items: bankDataList
                      .map<DropdownMenuItem<BankListDataModel>>((BankListDataModel value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Row(
                        children: [
                          Text(value.bank_name),
                        ],
                      ),
                    );
                  }).toList(),
                  isExpanded: true,
                  isDense: true,
                  onChanged: (newSelectedBank) {
                    _onDropDownItemSelected(newSelectedBank!);
                  },
                  value: _bankChoose,
                ),
              ),
            ),
          ),
          actions: [
            Theme(
              data: Theme.of(context).copyWith(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: IconButton(
                icon: Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {
                  // Обработчик нажатия
                },
              ),
            ),
          ],
          elevation: 0,
        ),
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

class BankListDataModel {
  String bank_name;
  String bank_logo;
  BankListDataModel(this.bank_name, this.bank_logo);
}
