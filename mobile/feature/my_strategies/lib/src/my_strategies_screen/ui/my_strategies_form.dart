import 'package:flutter/material.dart';

class MyStrategiesForm extends StatelessWidget {
  const MyStrategiesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF21213B),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 10),
          Container(
            padding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 60), // Паддинг внутри контейнера
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3), // Граница контейнера
              borderRadius: BorderRadius.circular(12), // Скругление углов рамки
              color: Color(0xFF212330), // Цвет фона текста
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 2), // Позиция тени
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
        ],
      )),
    );
  }
}