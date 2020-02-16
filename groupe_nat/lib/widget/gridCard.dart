import 'package:flutter/material.dart';

class GridCard extends StatefulWidget {
  GridCard({Key key, @required this.name, @required this.pageName, @required this.icon}) : super(key: key);

  final String name;
  final IconData icon;
  final String pageName;

  @override
  _GridCard createState() => new _GridCard();
}

class _GridCard extends State<GridCard> {
  _gestureManagement() {
    if (widget.pageName.isNotEmpty) {
      Navigator.pushNamed(context, widget.pageName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => _gestureManagement(),
        child: Card(
          margin: const EdgeInsets.all(5),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(widget.icon, size: 80.0),
                Text(
                  widget.name,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
        ));
  }
}
