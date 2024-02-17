import 'dart:math' as math;

import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../bloc/public_strategies_bloc.dart';

class WelcomeForm extends StatelessWidget {
  const WelcomeForm({Key? key}) : super(key: key);

  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
              begin: Alignment(-0.2, -0.8),
              end: Alignment.bottomCenter,
              colors: [
                Color(0x007CBFCF),
                Color(0xB3196FAB),
              ]),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(begin: Alignment(0.6, -1.1), end: Alignment(0.7, 0.8), colors: [
          Color(0x8B4E79D2),
          Color(0x005CDBCF),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.LoginBackground,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: AppColors.LoginPrimary),
      ),
      home: Scaffold(
        body: BlocBuilder<PublicStrategiesBloc, WelcomeState>(
          builder: (BuildContext context, WelcomeState state) {
            return Stack(
              children: [
                Scaffold(
                    body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.4,
                              child: AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.asset(
                                  AppImages.onBoarding1,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.onboardingScreen_description.watchTr(context),
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 1.2,
                              ),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              LocaleKeys.onboardingScreen_header.watchTr(context),
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 1.4,
                                shadows: [
                                  Shadow(
                                    offset: Offset(2.0, 2.0),
                                    blurRadius: 4.0,
                                    color: Colors.black.withOpacity(0.25),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ElevatedButton(
                              style: buttonPrimary,
                              onPressed: () {},
                              child: Text(
                                  LocaleKeys.buttons_createAddress.watchTr(context).toUpperCase()),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              style: buttonPrimary,
                              onPressed: () {
                                context.read<PublicStrategiesBloc>().add(ImportAddress());
                              },
                              child: Text(
                                  LocaleKeys.buttons_importAddress.watchTr(context).toUpperCase()),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
