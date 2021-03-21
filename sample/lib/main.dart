import 'package:flutter/material.dart';
import 'package:sample/pages/choose_location.dart';
import 'pages/home.dart';
import 'pages/location.dart';
import 'pages/sample.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      initialRoute: '/location',
      routes: {
        '/location': (context) => Location(),
        '/home': (context) => HomePage(),
        '/sample': (context) => Sample(),
        '/chooseLocation': (context) => ChooseLocation(),
      },
    );
  }
}
