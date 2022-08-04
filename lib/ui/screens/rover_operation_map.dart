import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_metrics.dart';

class RoverOperationMap extends StatefulWidget {
  late Rx<RoverMetrics> roverMetricsObs;
  RoverOperationMap(this.roverMetricsObs, {Key? key}) : super(key: key);

  @override
  State<RoverOperationMap> createState() => _RoverOperationMapState();
}

class _RoverOperationMapState extends State<RoverOperationMap> {
  final LatLng showLocation = const LatLng(40.474019558671344, -104.9693540321517);
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  BitmapDescriptor mapMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor roverMarkerIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor garageMarkerIcon = BitmapDescriptor.defaultMarker;

  setMarkerIcons() async {
    mapMarkerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/pi_lit_icon.png');
    roverMarkerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/rover_icon_new.png');
    garageMarkerIcon = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/garage_icon_2.png');

    updateMarkers(widget.roverMetricsObs.value);
  }

  void updateMarkers(RoverMetrics roverMetrics) {
    var tempMarkers = getMarkers(roverMetrics);
    setState(() {
      markers = tempMarkers;
    });
  }

  @override
  void initState() {
    super.initState();
    setMarkerIcons();

    widget.roverMetricsObs.listen((roverMetrics) {
      updateMarkers(roverMetrics);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: widget.roverMetricsObs.value.telemetry.location.latLng,
            zoom: 15.0,
          ),
          markers: markers,
          mapType: MapType.hybrid,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
            onPressed: () async => mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                target: widget.roverMetricsObs.value.telemetry.location.latLng, zoom: await mapController!.getZoomLevel()))),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
            child: const Icon(Icons.assistant_navigation),
          ),
        ),
      ]),
    );
  }

  Set<Marker> getMarkers(RoverMetrics roverMetrics) {
    Set<Marker> markers = {};

    if (roverMetrics.garage != null) {
      markers.add(Marker(
        markerId: MarkerId(roverMetrics.garage!.garage_id),
        position: roverMetrics.garage?.location.latLng,
        infoWindow: InfoWindow(
          title: roverMetrics.garage?.garage_id,
        ),
        icon: garageMarkerIcon,
        zIndex: 5,
      ));
    }

    markers.addAll(roverMetrics.pi_lits.deployed_pi_lits.map((piLit) => Marker(
          markerId: MarkerId(piLit.pi_lit_id),
          position: piLit.location.latLng,
          infoWindow: InfoWindow(
            title: piLit.pi_lit_id,
          ),
          icon: mapMarkerIcon,
          zIndex: 7,
        )));

    markers.add(Marker(
      markerId: MarkerId(roverMetrics.rover_id),
      position: roverMetrics.telemetry.location.latLng,
      infoWindow: InfoWindow(
        title: roverMetrics.rover_id,
      ),
      icon: roverMarkerIcon,
      zIndex: 10,
    ));

    return markers;
  }
}
