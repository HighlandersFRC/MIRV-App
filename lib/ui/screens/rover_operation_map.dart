import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/rover/rover_metrics.dart';

class RoverOperationMap extends StatefulWidget {
  final BehaviorSubject<LatLng> locationStream;
  final RoverMetrics roverMetrics;

  const RoverOperationMap({Key? key, required this.locationStream, required this.roverMetrics}) : super(key: key);

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
                target: LatLng(widget.roverMetrics.telemetry.location.lat, widget.roverMetrics.telemetry.location.long),
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
      ...widget.roverMetrics.pi_lits.deployed_pi_lits.map((piLit) {
        return Marker(
          //add first marker
          markerId: MarkerId(piLit.pi_lit_id),
          position: piLit.location.latLng, //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: piLit.pi_lit_id,
            snippet: 'Pi-lit device',
          ),
          icon: mapMarker,
        );
        //add more markers here
      }),
    };

    var marker = Marker(
        //add first marker
        markerId: MarkerId(widget.roverMetrics.rover_id),
        position:
            LatLng(widget.roverMetrics.telemetry.location.lat, widget.roverMetrics.telemetry.location.long), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: widget.roverMetrics.rover_id,
          snippet: 'My Custom Subtitle',
        ),
        icon: roverMarker,
        onTap: () async {
          mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(widget.roverMetrics.telemetry.location.lat, widget.roverMetrics.telemetry.location.long),
              zoom: await mapController!.getZoomLevel())));
        });

    markers.add(marker);

    return markers;
  }
}
