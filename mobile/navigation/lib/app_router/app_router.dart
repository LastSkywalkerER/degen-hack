import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:create_address/create_address.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:import_address/import_address.dart';
import 'package:info/info.dart';
import 'package:my_strategies/my_strategies.dart';
import 'package:my_wallet/my_wallet.dart';
import 'package:public_strategies/public_strategies.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: WelcomeScreen,
    ),
    AutoRoute(
      page: ImportAddressScreen,
    ),
    AutoRoute(
      page: HomeScreen,
    ),
    AutoRoute(
      page: CreateAddressScreen,
    ),
    AutoRoute(
      page: InfoScreen,
    ),
    AutoRoute(
      page: MyStrategiesScreen,
    ),
    AutoRoute(
      page: MyWalletScreen,
    ),
    AutoRoute(
      page: PublicStrategiesScreen,
    )
  ],
)
class AppRouter extends _$AppRouter {}
