import 'package:flutter/material.dart';
import 'package:groupe_nat/page/homePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          cardColor: Color(0xFFF2F1F2),
          iconTheme: IconThemeData(color: Color(0xFF0098BD)),
          floatingActionButtonTheme:
              FloatingActionButtonThemeData(backgroundColor: Colors.green),
          appBarTheme: AppBarTheme(color: Color(0xFFE73339))),
      home: HomePage(title: 'Accueil'),
    );
  }
}
