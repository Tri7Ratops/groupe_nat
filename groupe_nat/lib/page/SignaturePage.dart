import 'package:flutter/material.dart';
import 'package:groupe_nat/utils/alert.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:save_in_gallery/save_in_gallery.dart';
import 'package:signature/signature.dart';

class SignaturePage extends StatefulWidget {
  static const String routeName = '/signature';

  SignaturePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(penStrokeWidth: 3, penColor: Colors.black);
  final _imageSaver = ImageSaver();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _controller.clear();
              },
            ),
            IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: () async {
                if (_controller.isEmpty) {
                  MyAlert.basic(context, AlertType.error, "Pas de signature",
                      "Vous ne pouvez pas télécharger une signature vide");
                } else {
                  var res = await _imageSaver.saveImage(
                    imageBytes: await _controller.toPngBytes(),
                    directoryName: "Mes signatures",
                  );
                  if (res == false) {
                    MyAlert.basic(context, AlertType.error, "Erreur lors du téléchargement",
                        "Le téléchargement a échoué, avez-vous refusé les accèes à l'application ?");
                  } else {
                    MyAlert.basic(context, AlertType.success, "Téléchargement réussi",
                        "La signature a été téléchargé sur votre appareil");
                  }
                }
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text(
                "Vous pouvez dans l’encadré ci-dessous rentrer une signature puis l’enregistrer grâce à l’icon 'Upload' et effacer la signature grâce à l’icon 'Delete'. Les signatures seront enregistrées dans votre gallery dans le dossier 'Mes signatures'",
                textAlign: TextAlign.justify,
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                  ),
                ),
                child: Signature(
                  controller: _controller,
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.5,
                  backgroundColor: Colors.white,
                ),
              )
            ],
          ),
        ));
  }
}
