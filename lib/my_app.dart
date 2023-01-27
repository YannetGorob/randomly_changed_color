import 'dart:math';

import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = 'Hey there';
  static const double fontSize = 50;
  static const int minBack = 100;
  static const int maxBack = 255;
  static const int minTitle = 0;
  static const int maxTitle = 155;
  static const double opacityBack = 0.6;
  static const double opacityTitle = 1;

  Color backgroundColor = Colors.white;
  Color titleColor = Colors.black;

  @override
  void initState() {
    backgroundColor = _getRandomColor(minBack, maxBack, opacityBack);
    titleColor = _getRandomColor(minTitle, maxTitle, opacityTitle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            setState(() {
              title = upperRandomLetter(title);
              backgroundColor = _getRandomColor(minBack, maxBack, opacityBack);
              titleColor = _getRandomColor(minTitle, maxTitle, opacityTitle);
            });
          },
          child: Container(
            color: backgroundColor,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Text(
                '$title!',
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: titleColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getRandomColor(int min, int max, double opacity) {
    if (opacity > 1 || opacity < 0) {
      throw Exception(
          'opacity is alpha channel of this color as a double, with 0.0 being transparent and 1.0 being fully opaque');
    }
    final random = Random();

    final r = random.nextInt(max - min) + min;
    final g = random.nextInt(max - min) + min;
    final b = random.nextInt(max - min) + min;

    return Color.fromRGBO(r, g, b, opacity);
  }

  String upperRandomLetter(String title) {
    final list = title.toLowerCase().split('');
    final random = Random();
    final index = random.nextInt(list.length);
    list[index] = list[index].toUpperCase();

    return list.join();
  }
}
