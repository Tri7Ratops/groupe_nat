import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationPage extends StatefulWidget {
  static const String routeName = '/geolocation';

  GeolocationPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _GeolocationPageState createState() => _GeolocationPageState();
}

class _GeolocationPageState extends State<GeolocationPage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p =
          await geolocator.placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
      setState(() {
        _currentPosition = position;
        _getAddressFromLatLng();
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: RaisedButton(
                  child: Text("Mettre à jour votre location", style: Theme.of(context).textTheme.button),
                  onPressed: () {
                    _getCurrentLocation();
                  },
                ),
              ),
              (_currentPosition != null)
                  ? Text(
                      "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}\n$_currentAddress",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    )
                  : Text("Impossible de récupérer votre location"),
            ],
          ),
        ));
  }
}
