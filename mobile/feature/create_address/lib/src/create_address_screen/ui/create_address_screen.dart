import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/create_address_bloc.dart';
import 'create_address_form.dart';

class CreateAddressScreen extends StatelessWidget {
  const CreateAddressScreen({Key? key}) : super(key: key);

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
