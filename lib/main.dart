import 'package:flutter/material.dart';

import 'homepage/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KaseMall',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.green,
      ),),
      home: MyHomePage(title: 'Kase Mall'),
    );
  }
}

