import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/create_address_bloc.dart';
import 'create_address_form.dart';

class CreateAddressScreen extends StatelessWidget {
  const CreateAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateAddressBloc>(
      create: (_) {
        return CreateAddressBloc(
          appRouter: appLocator<AppRouter>(),
        );
      },
      child: const CreateAddressForm(),
    );
  }
}
