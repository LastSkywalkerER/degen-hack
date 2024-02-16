import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/welcome_bloc.dart';
import 'welcome_form.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WelcomeBloc>(
      create: (_) {
        return WelcomeBloc(
          appRouter: appLocator<AppRouter>(),
        );
      },
      child: const WelcomeForm(),
    );
  }
}
