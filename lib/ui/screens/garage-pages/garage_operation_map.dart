import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';
import 'package:mirv/models/pi_lit.dart';
import 'package:mirv/models/rover/rover_metrics.dart';
import 'package:mirv/models/garage/garage_metrics.dart';

class GarageOperationMap extends StatefulWidget {
  final BehaviorSubject<LatLng> locationStream;
  final GarageMetrics selectedGarageMetrics;

  final List<PiLit> piLitMarkers;

  const GarageOperationMap(
      {Key? key, required this.locationStream, required this.piLitMarkers, required this.selectedGarageMetrics})
      : super(key: key);

  @override
  State<GarageOperationMap> createState() => _GarageOperationMapState();
}

class _GarageOperationMapState extends State<GarageOperationMap> {
  final LatLng showLocation = const LatLng(40.474019558671344, -104.9693540321517);
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  BitmapDescriptor garageMarker = BitmapDescriptor.defaultMarker;

  void setMarkerIcon() async {
    var garageMapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/garage_icon_2.png');

    setState(() {
      garageMarker = garageMapMarker;
    });
  }

  @override
  void initState() {
    super.initState();
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
          markers: getMarkers(garageMarker),
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
                target: LatLng(widget.selectedGarageMetrics.location.lat, widget.selectedGarageMetrics.location.long),
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

  Set<Marker> getMarkers(garageMarker) {
    var marker = Marker(
        //add first marker
        markerId: MarkerId(widget.selectedGarageMetrics.garage_id),
        position:
            LatLng(widget.selectedGarageMetrics.location.lat, widget.selectedGarageMetrics.location.long), //position of marker
        infoWindow: InfoWindow(
          //popup info
          title: widget.selectedGarageMetrics.garage_id,
          snippet: '',
        ),
        icon: garageMarker,
        onTap: () async {
          mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(widget.selectedGarageMetrics.location.lat, widget.selectedGarageMetrics.location.long),
              zoom: await mapController!.getZoomLevel())));
        });

    markers.add(marker);

    return markers;
  }
}
