import 'package:auth/auth.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: WelcomeScreen,
    )
  ],
)
class AppRouter extends _$AppRouter {}
