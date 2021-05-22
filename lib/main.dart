import 'package:binarytree_mobile_app/pages/CalculatorPage.dart';
import 'package:binarytree_mobile_app/pages/InfoPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => CalculatorPage(),
        '/info': (BuildContext context) => InfoPage()
      },
    );
  }
}
