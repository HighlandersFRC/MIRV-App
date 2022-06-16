import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GooMap extends StatefulWidget {
  
  final Location location;
  GooMap(this.location);



  @override
  _GooMapState createState() => _GooMapState();
}





class _GooMapState extends State<GooMap> {

LatLng _cameraCenterLocation = new LatLng(40.47382939771208, -104.96933444375819);
    
LocationData? _locationData;

  Set<Marker> markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();
  List<LatLng> polygonLatLngs = <LatLng>[];
  double radius = 10.0;

  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  GoogleMapController? _googleMapController;


  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  bool _isPolygon = true;
  bool _isMarker = false;
  bool _isCircle = false;

  @override
  void initState(){
    super.initState();

   // _locationData = widget.location;
    // widget.location.onLocationChanged.listen((event) { if (event.latitude == null|| event.longitude == null) return;
    //   _googleMapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng (event.latitude!, event.longitude!), zoom: 16)));});
    
  }
  void _setMarkerIcon() async {
    _markerIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(), 'assets/images/pi_lit_icon.png');
  }

  void _setCircles(LatLng point) {
    final String circleIdVal = 'circle_id_$_circleIdCounter';
    _circleIdCounter++;
    print(
      'Circle | Latitude: ${point.latitude} Longitude: ${point.longitude} Radius: $radius');
    _circles.add(Circle(
      circleId: CircleId(circleIdVal),
      center: point,
      radius: radius,
      fillColor: Colors.redAccent.withOpacity(0.5),
      strokeWidth: 3,
      strokeColor: Colors.redAccent));
  }

  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
  }

  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      print(
        'Marker | Latitude: ${point.latitude} Longitude: ${point.longitude}');
        markers.add(
          Marker(
            markerId: MarkerId(markerIdVal),
            position: point,
          ),
        );
    });
  }


  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;

    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId('0'),
          position: LatLng(-20.131886, -47.484488),
          infoWindow: 
            InfoWindow( title: 'Pi-Lit', snippet: "Number One"),
        ),
      );
    });
  }
  Widget _fabPolygon(){
    return FloatingActionButton.extended(
      onPressed: () {
        setState(() {
          polygonLatLngs.removeLast();
        });
      },
      icon: Icon(Icons.undo),
      label: Text('Undo point'),
      backgroundColor: Colors.orange,
    );
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('MIRV Map'),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButton: 
        polygonLatLngs.length > 0 && _isPolygon ?_fabPolygon() : null,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _cameraCenterLocation,
              zoom: 16,
            ),
            mapType: MapType.hybrid,
            onMapCreated: _onMapCreated,
            // markers: markers,
            // circles: _circles,
            // polygons: _polygons,
            // myLocationEnabled: true,
            // onTap: (point) {
            //   if (_isPolygon) {
            //     setState(() {
            //       polygonLatLngs.add(point);
            //       _setPolygon();
            //     });
            //   } else if (_isMarker) {
            //     setState(() {
            //       markers.clear();
            //       _setMarkers(point);
            //     });
            //   } else if (_isCircle) {
            //     setState(() {
            //       _circles.clear();
            //       _setCircles(point);
            //     });
            //   }
            // },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget> [
                ElevatedButton(
                  onPressed: () {
                    _isPolygon = true;
                    _isMarker = false;
                    _isCircle = false;
                  child: const Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 50,
                      color: Colors.black54
                    );
                  },
                  child: Text(
                    'Polygon',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  )),
              ElevatedButton(
                onPressed: () {
                  _isPolygon = false;
                  _isMarker = true;
                  _isCircle = false;
              child: const Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 50,
                      color: Colors.black54
                    );
                },
                child: Text('Marker',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
              ElevatedButton(
                onPressed: () {
                  _isPolygon = false;
                  _isMarker = false;
                  _isCircle = true;
                  radius = 50;
                child: const Icon(
                      Icons.arrow_right_alt_rounded,
                      size: 50,
                      color: Colors.black54
                    );
                 showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              backgroundColor: Colors.grey[900],
                              title: Text(
                                'Choose the radius (m)',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                              content: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Material(
                                    color: Colors.black,
                                    child: TextField(
                                      style: TextStyle(fontSize: 16, color: Colors.white),
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.zoom_out_map),
                                        hintText: 'Ex: 100',
                                        suffixText: 'meters',
                                      ),
                                      keyboardType:
                                          TextInputType.numberWithOptions(),
                                      onChanged: (input) {
                                        setState(() {
                                          radius = double.parse(input);
                                        });
                                      },
                                    ),
                                  )),
                              actions: <Widget>[
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,),
                                    )),
                              ],
                            ));
          },
          child: Text('Circle',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))
            ],
           ),
          )
        ],
      ));
  }
}




