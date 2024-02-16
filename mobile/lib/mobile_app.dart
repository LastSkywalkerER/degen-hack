import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import 'observer_bloc/observer_bloc.dart';

class MobileApp extends StatelessWidget {
  const MobileApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      builder: (BuildContext context, Widget? child) {
        return BlocProvider<ObserverBloc>(
          create: (_) {
            return ObserverBloc(
              appRouter: appLocator<AppRouter>(),
            );
          },
          child: BlocBuilder<ObserverBloc, ObserverState>(
            builder: (BuildContext context, ObserverState state) {
              return child!;
            },
          ),
        );
      },
    );
  }
}
