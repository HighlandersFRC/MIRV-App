import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover_metrics.dart';

class RoverOperationMap extends StatefulWidget {
  final BehaviorSubject<LatLng> locationStream;
  final RoverMetrics selectedRoverMetrics;

  final List<PiLit> piLitMarkers;

  const RoverOperationMap(
      {Key? key, required this.locationStream, required this.piLitMarkers, required this.selectedRoverMetrics})
      : super(key: key);

  @override
  State<RoverOperationMap> createState() => _RoverOperationMapState();
}

class _RoverOperationMapState extends State<RoverOperationMap> {
  final LatLng showLocation = const LatLng(40.474019558671344, -104.9693540321517);
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  BitmapDescriptor roverMarker = BitmapDescriptor.defaultMarker;

  void setCustomMarker() async {
    var tempMapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/pi_lit_icon.png');

    setState(() {
      mapMarker = tempMapMarker;
    });
  }

  void setMarkerIcon() async {
    var roverMapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/rover_icon.png');

    setState(() {
      roverMarker = roverMapMarker;
    });
  }

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    setMarkerIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                target: LatLng(
                    widget.selectedRoverMetrics.telemetry.location.lat, widget.selectedRoverMetrics.telemetry.location.long),
                zoom: await mapController!.getZoomLevel()))),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.assistant_navigation),
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
    };

    var marker = Marker(
        //add first marker
        markerId: MarkerId(widget.selectedRoverMetrics.roverId),
        position: LatLng(widget.selectedRoverMetrics.telemetry.location.lat,
            widget.selectedRoverMetrics.telemetry.location.long), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: widget.selectedRoverMetrics.roverId,
          snippet: 'My Custom Subtitle',
        ),
        icon: roverMarker,
        onTap: () async {
          mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target:
                  LatLng(widget.selectedRoverMetrics.telemetry.location.lat, widget.selectedRoverMetrics.telemetry.location.long),
              zoom: await mapController!.getZoomLevel())));
        });

    markers.add(marker);

    return markers;
  }
}
