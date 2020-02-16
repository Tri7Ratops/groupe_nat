import 'package:flutter/material.dart';
import 'package:groupe_nat/page/DocumentsPage.dart';
import 'package:groupe_nat/page/SecurePage.dart';
import 'package:groupe_nat/page/SignaturePage.dart';
import 'package:groupe_nat/page/UploadDocumentPage.dart';
import 'package:groupe_nat/page/documentPage.dart';
import 'package:groupe_nat/page/geolocationPage.dart';
import 'package:groupe_nat/page/homePage.dart';
import 'package:groupe_nat/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groupe NAT',
      initialRoute: "/",
      routes: {
        Routes.home: (context) => HomePage(title: 'Accueil'),
        Routes.geolocation: (context) => GeolocationPage(
              title: 'Geolocalisation',
            ),
        Routes.secure: (context) => SecurePage(title: '3D Secure'),
        Routes.signature: (context) => SignaturePage(title: 'Signature'),
        Routes.upload: (context) => UploadDocumentPage(title: 'Ajout d\'un document'),
        Routes.documents: (context) => DocumentsPage(title: 'Mes documents'),
        Routes.document: (context) => DocumentPage()
      },
      theme: ThemeData(
          primaryColorDark: Color(0xFF000000),
          inputDecorationTheme: InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF0098BD), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2.0),
            ),
          ),
          errorColor: Colors.redAccent,
          textTheme: TextTheme(
              button: TextStyle(color: Color(0xFFFFFFFF)), display1: TextStyle(color: Color(0xFFFFFFFF), fontSize: 15)),
          buttonTheme: ButtonThemeData(buttonColor: Color(0xFF0098BD)),
          cardColor: Color(0xFFF2F1F2),
          iconTheme: IconThemeData(color: Color(0xFF0098BD)),
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.green),
          appBarTheme: AppBarTheme(color: Color(0xFFE73339))),
    );
  }
}
