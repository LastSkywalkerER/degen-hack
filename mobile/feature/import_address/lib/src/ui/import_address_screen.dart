import 'package:core/core.dart';
import 'package:domain/wallet/wallet.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/import_address_bloc.dart';
import 'widgets/import_address_form.dart';

class ImportAddressScreen extends StatelessWidget {
  const ImportAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ImportAddressBloc>(
      create: (BuildContext context) => ImportAddressBloc(
        appRouter: appLocator<AppRouter>(),
        createWalletUseCase: appLocator<CreateWalletUseCase>(),
      ),
      child: const ImportAddressForm(),
    );
  }
}
