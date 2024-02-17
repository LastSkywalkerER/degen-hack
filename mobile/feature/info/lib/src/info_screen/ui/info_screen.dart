import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

import '../bloc/info_bloc.dart';
import 'info_form.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InfoBloc>(
      create: (_) {
        return InfoBloc(
          appRouter: appLocator<AppRouter>(),
        );
      },
      child: const InfoForm(),
    );
  }
}
