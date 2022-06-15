import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:test/ui/screens/google_map_pt2.dart';

class MapPage extends StatefulWidget {
  @override 
  _MapPageState createState() => _MapPageState();
}
class _MapPageState extends State<MapPage> {
  Location location = new Location();
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

void _checkLocationPermission() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }
  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied){
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted){
      return;
    }
  }
  _locationData = await location.getLocation();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text('MIRV Map'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _locationData != null ? Navigator.push(
          context, MaterialPageRoute(builder: (context) => GooMap(location))) : null,
        backgroundColor: Colors.orange,
        label: Row(
          children: <Widget>[
            Text( 
              'Open Maps',
              style: TextStyle(color: Colors.black87),
            ),
            Icon(
              Icons.map,
              color: Colors.black87,
            ),
          ],
        )),
        body: Container( 
          padding: EdgeInsets.all(16),
        child: Center( 
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Rover Map',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height:20),
          Text(
            'Map to track rovers + Pi-Lits',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      )),
     ),
    );
  }
}
