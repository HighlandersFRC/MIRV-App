import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/models/rover_location.dart';

class RoverOperationMap extends StatefulWidget {
  final BehaviorSubject<LatLng> locationStream;
  final List<RoverLocation> piLitMarkers;
  List<Polygon>? lanes;

  RoverOperationMap(
      {Key? key,
      required this.locationStream,
      required this.piLitMarkers,
      this.lanes})
      : super(key: key);

  @override
  State<RoverOperationMap> createState() => _RoverOperationMapState();
}

class _RoverOperationMapState extends State<RoverOperationMap> {
  static LatLng showLocation = LatLng(40.474019558671344, -104.9693540321517);
  GoogleMapController? mapController;
  Set<Marker> markers = new Set();
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  void setCustomMarker() async {
    var tempMapMarker = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/images/pi_lit_icon.png');
    setState(() {
      mapMarker = tempMapMarker;
    });
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rover 1"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Stack(children: <Widget>[
        GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: showLocation,
            zoom: 15.0,
          ),
          markers: getMarkers(mapMarker),
          mapType: MapType.hybrid,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
            this.widget.locationStream.stream.listen((location) => mapController
                ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: LatLng(location.latitude, location.longitude)))));
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () {
              (location) => mapController?.animateCamera(
                  CameraUpdate.newCameraPosition(CameraPosition(
                      target: LatLng(location.latitude, location.longitude))));
            },
            child: const Icon(Icons.map),
          ),
        ),
      ]),
    );
  }

  Set<Marker> getMarkers(mapMarker) {
    //markers to place on map
    var markers = {
      ...this.widget.piLitMarkers.map((piLit) {
        return Marker(
          //add first marker
          markerId: MarkerId(piLit.roverId),
          position: piLit.location, //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: piLit.roverId,
            snippet: 'My Custom Subtitle',
          ),
          icon: mapMarker,
          // onTap: () async {
          //   mapController?.animateCamera(CameraUpdate.newCameraPosition(
          //       CameraPosition(
          //           target: piLit.location,
          //           zoom: await mapController!.getZoomLevel())));
          // }
        );
        //add more markers here
      })
    };
    return markers;
  }
}
