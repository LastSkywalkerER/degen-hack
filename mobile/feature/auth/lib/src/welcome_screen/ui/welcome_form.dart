import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class WelcomeForm extends StatelessWidget {
  const WelcomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto Wallet'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton.primary(
              title: LocaleKeys.buttons_createAddress.watchTr(context).toUpperCase(),
              onPressed: () => {print("Hello")},
            ),
            AppButton.primary(
              title: LocaleKeys.buttons_importAddress.watchTr(context).toUpperCase(),
              onPressed: () => {print("Hello")},
            )
          ],
        ),
      ),
    );
  }
}
