import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/welcome_bloc.dart';

class WelcomeForm extends StatelessWidget {
  const WelcomeForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF171822),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(AppImages.onBoarding1),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _topContent(context),
                    _centerContent(context),
                    _bottomContent(context)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _topContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          height: 18,
        ),
        Row(
          children: <Widget>[
            Text(
              "Blockchain hackaton",
              style: GoogleFonts.poppins(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          "18.02.2024",
          style: GoogleFonts.poppins(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }

  Widget _centerContent(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //SvgPicture.asset(logo),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Name | Logo',
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            'Bank solution.\nPayouts.\n\nJoin For Free.',
            style: GoogleFonts.poppins(
              height: 1.6,
              fontSize: 12,
              color: const Color(0xff7b7f9e),
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomContent(BuildContext context) {
    return Column(
      children: <Widget>[
        MaterialButton(
          elevation: 0,
          color: const Color(0xFFFFAC30),
          height: 50,
          minWidth: 200,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          onPressed: () {
            context.read<WelcomeBloc>().add(CreateNewAddress());
          },
          child: Text(
            LocaleKeys.buttons_importAddress.watchTr(context),
            style: GoogleFonts.poppins(
              fontSize: 15,
              height: 1.6,
              color: const Color(0xff212330),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          LocaleKeys.buttons_createAddress.watchTr(context),
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: const Color(0xffffffff),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
