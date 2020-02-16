import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:groupe_nat/repository/documentRepository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UploadDocumentPage extends StatefulWidget {
  static const String routeName = '/upload';

  UploadDocumentPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _UploadDocumentPageState createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  final _nameController = TextEditingController();
  File _image;

  _getImage() async {
    FocusScope.of(context).unfocus(focusPrevious: true);
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() => _image = image);
  }

  _alert(AlertType type, String title, String description) {
    Alert(
      closeFunction: () {},
      context: context,
      type: type,
      title: title,
      desc: description,
      buttons: [
        DialogButton(
          child: Text(
            "Compris",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.file_upload),
              onPressed: () async {
                if (_nameController.text.isEmpty || _image == null) {
                  _alert(AlertType.error, "Champs manquants",
                      "${(_nameController.text.isEmpty) ? "- Nom du document\n" : ""}${(_image == null) ? "- Fichier" : ""}");
                } else {
                  await API_DOCUMENTS.createUser(_nameController.text, _image);
                  _alert(AlertType.success, "Upload réussi", "");
                  setState(() {
                    _image = null;
                    _nameController.text = "";
                  });
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  "Uniquement les fichiers png et jpeg sont acceptés actuellement. Veuillez saisir votre fichier ainsi que son nom puis cliquez sur l’icon « Upload » dans la barre de navigation pour envoyer au serveur le fichier.",
                  textAlign: TextAlign.justify),
              Divider(),
              TextField(
                decoration: new InputDecoration(
                  hintText: 'Nom du fichier',
                ),
                controller: _nameController,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 20),
                child: RaisedButton(
                  onPressed: () => _getImage(),
                  child: Text((_image != null) ? "Changer de fichier" : "Choisir mon fichier",
                      style: Theme.of(context).textTheme.display1),
                ),
              ),
              (_image == null) ? Text("Pas de fichier joint") : Image.file(_image)
            ],
          ),
        ));
  }
}
