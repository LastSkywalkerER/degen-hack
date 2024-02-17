import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/public_strategies_bloc.dart';
import 'public_strategies_form.dart';

class PublicStrategiesScreen extends StatelessWidget {
  const PublicStrategiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PublicStrategiesBloc>(
      create: (_) {
        return PublicStrategiesBloc(
          appRouter: appLocator<AppRouter>(),
        );
      },
      child: const WelcomeForm(),
    );
  }
}
