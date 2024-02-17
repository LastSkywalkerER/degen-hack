import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoForm extends StatelessWidget {
  const InfoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String yourWallet = "0x234..DS93";

    List<String> descriptions = ['Deposit in AAVE', 'Borrow in AAVE', 'Buy RWA', 'Stake RWA'];

    return Scaffold(
      backgroundColor: Color(0xFF21213B),
      body: Column(
        children: [
          SizedBox(height: 10),
          Text(
            "Your wallet: $yourWallet",
            style: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.symmetric(),
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              children: List.generate(4, (index) {
                return StrategyCard(
                  title: 'Strategy ${index + 1}',
                  description: descriptions[index],
                );
              }),
            ),
          ),
          MaterialButton(
            elevation: 0,
            color: const Color(0xFFFFAC30),
            height: 50,
            minWidth: 350,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              //context.read<WelcomeBloc>().add(CreateNewAddress());
            },
            child: Text(
              'Start Complex Strategy',
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.6,
                color: const Color(0xff212330),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            elevation: 0,
            color: const Color(0xFFFFAC30),
            height: 50,
            minWidth: 350,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              //context.read<WelcomeBloc>().add(CreateNewAddress());
            },
            child: Text(
              'Public Complex Strategy',
              style: GoogleFonts.poppins(
                fontSize: 15,
                height: 1.6,
                color: const Color(0xff212330),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }
}

class StrategyCard extends StatelessWidget {
  final String title;
  final String description;

  const StrategyCard({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF212330),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              description,
              style: GoogleFonts.poppins(
                height: 1.6,
                fontSize: 12,
                color: const Color(0xff7b7f9e),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 10),
            InkWell(
              onTap: () => {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Icons.settings, color: Colors.white), // Иконка настроек
                  SizedBox(width: 8), // Отступ между иконкой и текстом
                  Text(
                    'Settings',
                    style: TextStyle(color: Colors.white), // Цвет текста настроек
                  ),
                ],
              ),
            ),
            Spacer(),
            Center(
              child: MaterialButton(
                elevation: 0,
                color: const Color(0xFFFFAC30),
                height: 50,
                minWidth: 100,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  //context.read<WelcomeBloc>().add(CreateNewAddress());
                },
                child: Text(
                  "Select",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    height: 1.6,
                    color: const Color(0xff212330),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
