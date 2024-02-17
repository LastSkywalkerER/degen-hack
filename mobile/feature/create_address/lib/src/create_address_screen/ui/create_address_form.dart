import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../bloc/create_address_bloc.dart';

class CreateAddressForm extends StatelessWidget {
  const CreateAddressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF171822),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Color(0xFF171822),
        title: const Text('Create new address'),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 100.0),
          child: Card(
            color: Color(0xFF212330),
            margin: EdgeInsets.all(20.0),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Your seed phrase',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Please copy and save this string',
                    style: GoogleFonts.poppins(
                      height: 1.6,
                      fontSize: 12,
                      color: const Color(0xff7b7f9e),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextField(
                    controller: TextEditingController(
                        text: "tattoo drink manual library brick kick leader possible head"),
                    readOnly: true,
                    cursorColor: Colors.white,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      labelText: 'Seed Phrase',
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // Обводка при фокусе
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        elevation: 0,
                        color: const Color(0xFFFFAC30),
                        height: 50,
                        minWidth: 150,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          //context.read<WelcomeBloc>().add(CreateNewAddress());
                        },
                        child: Text(
                          "Copy",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            height: 1.6,
                            color: const Color(0xff212330),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      MaterialButton(
                        elevation: 0,
                        color: const Color(0xFFFFAC30),
                        height: 50,
                        minWidth: 150,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          context.read<CreateAddressBloc>().add(NextClick());
                        },
                        child: Text(
                          "Next",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            height: 1.6,
                            color: const Color(0xff212330),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
