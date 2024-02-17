import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/my_wallet_bloc.dart';
import 'my_wallet_form.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MyWalletBloc>(
      create: (_) {
        return MyWalletBloc(
          appRouter: appLocator<AppRouter>(),
        );
      },
      child: const WelcomeForm(),
    );
  }
}
