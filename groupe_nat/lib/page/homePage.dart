import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe_nat/routes.dart';
import 'package:groupe_nat/widget/gridCard.dart';

class _homeItem {
  String name;
  IconData icon;
  String pageName;

  _homeItem(this.name, this.icon, this.pageName);
}

class HomePage extends StatefulWidget {
  static const String routeName = '/';
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<_homeItem> _list = [
    _homeItem("Mes documents", Icons.folder, Routes.documents),
    _homeItem("Ajout d'un document", Icons.file_upload, Routes.upload),
    _homeItem("Geolocalisation", Icons.pin_drop, Routes.geolocation),
    _homeItem("Signature", Icons.brush, Routes.signature),
    _homeItem("3D secure", Icons.security, Routes.secure),
    _homeItem("Live document", Icons.group, ""),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              crossAxisCount: 2,
              primary: false,
              padding: const EdgeInsets.all(2.0),
              children: List.generate(_list.length, (index) {
                return (new GridCard(
                  name: _list[index].name,
                  icon: _list[index].icon,
                  pageName: _list[index].pageName,
                ));
              })),
        ));
  }
}
