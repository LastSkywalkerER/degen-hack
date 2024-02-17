import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImportAddressForm extends StatefulWidget {
  const ImportAddressForm({
    super.key,
  });

  @override
  State<ImportAddressForm> createState() => _ImportAddressFormState();
}

class _ImportAddressFormState extends State<ImportAddressForm> {
  String seedValue = '';
  final TextEditingController seedPhraseController = TextEditingController();

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
        title: const Text('Import existing address'),
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
                    'Please enter your seed phrase',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
                        minWidth: 300,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          //context.read<WelcomeBloc>().add(CreateNewAddress());
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
