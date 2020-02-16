import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyAlert {
  static basic(context, type, title, description) {
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

  static confirm(context, type, title, description, callback) {
    Alert(
      closeFunction: () {},
      context: context,
      type: AlertType.error,
      title: title,
      desc: description,
      buttons: [
        DialogButton(
            child: Text(
              "Annuler",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
            color: Theme.of(context).errorColor),
        DialogButton(
          child: Text(
            "Confirmer",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            callback();
            Navigator.pop(context);
          },
          width: 120,
        ),
      ],
    ).show();
  }
}
