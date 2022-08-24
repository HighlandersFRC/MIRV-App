// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/settings_default.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';

class RoverOperationMap extends StatefulWidget {
  late Rx<RoverGarageState> roverMetricsObs;
  RoverOperationMap(this.roverMetricsObs, {Key? key}) : super(key: key);

  @override
  State<RoverOperationMap> createState() => _RoverOperationMapState();
}

class _RoverOperationMapState extends State<RoverOperationMap> {
  StreamSubscription? getMarkerSubscription;
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

  void updateMarkers(RoverGarageState roverGarageState) {
    var tempMarkers = getMarkers(roverGarageState);
    setState(() {
      markers = tempMarkers;
    });
  }

  @override
  void initState() {
    super.initState();
    setMarkerIcons();

    getMarkerSubscription = widget.roverMetricsObs.listen((roverGarageState) {
      updateMarkers(roverGarageState);
    });
  }

  @override
  void dispose() {
    getMarkerSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition: CameraPosition(
            target: widget.roverMetricsObs.value.telemetry.location.latLng,
            zoom: SettingsDefaults.initialMapZoom,
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

  Set<Marker> getMarkers(RoverGarageState roverGarageState) {
    Set<Marker> markers = {};

    if (roverGarageState.garage != null) {
      markers.add(Marker(
        markerId: MarkerId(roverGarageState.garage!.garage_id),
        position: roverGarageState.garage?.location.latLng,
        infoWindow: InfoWindow(
          title: roverGarageState.garage?.garage_id,
        ),
        icon: garageMarkerIcon,
        zIndex: 5,
      ));
    }

    markers.addAll(roverGarageState.pi_lits.deployed_pi_lits.map((piLit) => Marker(
          markerId: MarkerId(piLit.pi_lit_id),
          position: piLit.location.latLng,
          infoWindow: InfoWindow(
            title: piLit.pi_lit_id,
          ),
          icon: mapMarkerIcon,
          zIndex: 7,
        )));

    markers.add(Marker(
      markerId: MarkerId(roverGarageState.rover_id),
      position: roverGarageState.telemetry.location.latLng,
      infoWindow: InfoWindow(
        title: roverGarageState.rover_id,
      ),
      icon: roverMarkerIcon,
      zIndex: 10,
    ));

    return markers;
  }
}
