import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe_nat/widget/myWebView.dart';

class SecurePage extends StatefulWidget {
  static const String routeName = '/secure';

  SecurePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SecurePageState createState() => _SecurePageState();
}

class _SecurePageState extends State<SecurePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Pour la fonctionnalité 3D Secure, il s’agira très certainement d’une adresse que me fournira le serveur.\nUne WebView me semble appropriée pour ce type d’approche.",
                textAlign: TextAlign.center,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWebView(
                              title: "lesjoiesducode.fr",
                              selectedUrl: "https://lesjoiesducode.fr/",
                            )));
                  },
                  child: Text("Exemple de WebView"),
                ),
              )
            ],
          ),
        )));
  }
}
