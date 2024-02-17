import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/my_strategies_bloc.dart';
import 'my_strategies_form.dart';

class MyStrategiesScreen extends StatelessWidget {
  const MyStrategiesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyStrategiesBloc>(
      create: (_) {
        return MyStrategiesBloc(
          appRouter: appLocator<AppRouter>(),
        );
      },
      child: const MyStrategiesForm(),
    );
  }
}
