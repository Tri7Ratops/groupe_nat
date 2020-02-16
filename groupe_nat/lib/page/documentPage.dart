import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe_nat/repository/documentRepository.dart';
import 'package:groupe_nat/routes.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:url_launcher/url_launcher.dart';

class DocumentPage extends StatefulWidget {
  static const String routeName = '/document';

  DocumentPage({Key key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    final DocumentArguments args = ModalRoute.of(context).settings.arguments;
    final documentURL = API_DOCUMENTS.globalEndpoint + args.document.filename;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.document.name),
        ),
        body: ModalProgressHUD(
          inAsyncCall: _loading,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                    "Voici votre document. Vous pouvez cliquer sur votre document et vous serez redirigé sur la photo stockée sur le serveur. Les signatures apparaissent en noir car le fond est transparent.",
                    textAlign: TextAlign.justify),
                Divider(),
                GestureDetector(
                  onTap: () async {
                    if (await canLaunch(documentURL)) {
                      await launch(documentURL);
                    }
                  },
                  child: Image.network(documentURL),
                )
              ],
            ),
          ),
        ));
  }
}
