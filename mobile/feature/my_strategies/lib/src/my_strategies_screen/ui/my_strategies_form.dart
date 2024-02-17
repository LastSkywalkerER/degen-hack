import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StrategyCard extends StatelessWidget {
  final String title;

  StrategyCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFF212330),
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          // Горизонтальное разделение для двух колонок
          crossAxisAlignment: CrossAxisAlignment.start, // Выравнивание колонок по верхнему краю
          children: <Widget>[
            Expanded(
              // Колонка для заголовка и кнопки
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  MaterialButton(
                    elevation: 0,
                    color: const Color(0xFFFFAC30),
                    height: 40,
                    minWidth: 100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    onPressed: () {
                      // Здесь код при нажатии на кнопку
                    },
                    child: Text(
                      "Close strategy",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        height: 1.3,
                        color: const Color(0xff212330),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // Колонка для текста "Details"
              child: Align(
                alignment:
                    Alignment.topRight, // Выравнивание текста "Details" по верхнему правому углу
                child: Text(
                  'Details:\nDescription\nDescription\nDescription',
                  style: GoogleFonts.poppins(
                    height: 1.6,
                    fontSize: 12,
                    color: const Color(0xff7b7f9e),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right, // Выравнивание текста по правому краю
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStrategiesForm extends StatelessWidget {
  const MyStrategiesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF21213B),
      body: Column(
        children: [
          SizedBox(height: 10), // Отступ сверху
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 60),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFF212330),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              "Strategies you've\ninvolved in",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center, // Выравнивание текста по центру
            ),
          ),
          SizedBox(height: 20), // Отступ сверху
          Expanded(
            // Использование Expanded для ListView.builder
            child: ListView.builder(
              itemCount: 6, // Можно изменить на желаемое количество элементов
              itemBuilder: (context, index) {
                return StrategyCard(title: 'Complex Strategy ${index + 1}');
              },
            ),
          ),
        ],
      ),
    );
  }
}
