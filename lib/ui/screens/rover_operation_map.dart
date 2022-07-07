import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test/models/pi_lit.dart';
import 'package:test/models/rover_metrics.dart';

class RoverOperationMap extends StatefulWidget {
  final BehaviorSubject<LatLng> locationStream;
  final List<RoverMetrics> roverMetrics;

  final List<PiLit> piLitMarkers;

  const RoverOperationMap({Key? key, required this.locationStream, required this.piLitMarkers, required this.roverMetrics})
      : super(key: key);

  @override
  State<RoverOperationMap> createState() => _RoverOperationMapState();
}

class _RoverOperationMapState extends State<RoverOperationMap> {
  final LatLng showLocation = const LatLng(40.474019558671344, -104.9693540321517);
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  void setCustomMarker() async {
    var tempMapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/pi_lit_icon.png');
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
      // appBar: AppBar(
      //   title: Text("Rover 1"),
      //   backgroundColor: Colors.deepOrangeAccent,
      // ),
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
            widget.locationStream.stream.listen((location) async => mapController?.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(location.latitude, location.longitude), zoom: await mapController!.getZoomLevel()))));
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () async => mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: LatLng(widget.locationStream.value.latitude, widget.locationStream.value.longitude),
                zoom: await mapController!.getZoomLevel()))),
            child: const Icon(Icons.map),
          ),
        ),
      ]),
    );
  }

  Set<Marker> getMarkers(mapMarker) {
    //markers to place on map
    var markers = {
      ...widget.piLitMarkers.map((piLit) {
        return Marker(
          //add first marker
          markerId: MarkerId(piLit.id),
          position: piLit.location, //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: piLit.id,
            snippet: 'Pi-lit device',
          ),
          icon: mapMarker,
        );

        //add more markers here
      }),
      ...widget.roverMetrics.map((rover) {
        return Marker(
            //add first marker
            markerId: MarkerId(rover.roverId),
            position: LatLng(rover.telemetry.location.lat, rover.telemetry.location.long), //position of marker
            infoWindow: InfoWindow(
              //popup info
              title: rover.roverId,
              snippet: 'My Custom Subtitle',
            ),
            icon: mapMarker,
            onTap: () async {
              mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                  target: LatLng(rover.telemetry.location.lat, rover.telemetry.location.long),
                  zoom: await mapController!.getZoomLevel())));
            });
      })
    };
    return markers;
  }
}
