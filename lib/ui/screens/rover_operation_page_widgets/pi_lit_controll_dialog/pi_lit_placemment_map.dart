import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mirv/constants/settings_default.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/rover/rover_state.dart';

class PiLitPlacementMap extends StatefulWidget {
  final Rx<RoverGarageState> roverMetricsObs;
  final Rx<LatLng?> startPoint;
  final Rx<LatLng?> endPoint;
  final Rx<bool> startPointOnMap;
  final Rx<List<RoverStatePiLit>> testPiLitLocations;

  const PiLitPlacementMap(
    this.roverMetricsObs,
    this.startPoint,
    this.endPoint,
    this.startPointOnMap,
    this.testPiLitLocations, {
    Key? key,
  }) : super(key: key);

  @override
  State<PiLitPlacementMap> createState() => _PiLitPlacementMapState();
}

class _PiLitPlacementMapState extends State<PiLitPlacementMap> {
  final LatLng showLocation = const LatLng(40.474019558671344, -104.9693540321517);
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  StreamSubscription? resetSub;

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
    var tempMarkers = getMarkers(
      roverGarageState,
      widget.testPiLitLocations.value,
    );
    setState(() {
      markers = tempMarkers;
    });
  }

  setStartMarker(LatLng tappedPoint) {
    widget.startPoint.value = tappedPoint;
    widget.startPoint.trigger(tappedPoint);
    setState(
      () {
        if (widget.startPoint.value != null) {
          markers.add(
            Marker(
                icon: BitmapDescriptor.defaultMarkerWithHue(115),
                draggable: true,
                onDragEnd: (newValue) {
                  widget.startPoint.value = newValue;
                },
                markerId: const MarkerId('Selected Start Point'),
                position: widget.startPoint.value!,
                infoWindow: const InfoWindow(
                  title: 'Selected Start Point',
                ),
                zIndex: 12),
          );
          widget.startPointOnMap.value = true;
        }
      },
    );
  }

  setEndMarker(LatLng tappedPoint) {
    widget.endPoint.value = tappedPoint;
    widget.endPoint.trigger(tappedPoint);

    setState(
      () {
        if (widget.endPoint.value != null) {
          markers.add(
            Marker(
                draggable: true,
                onDragEnd: (newValue) {
                  widget.endPoint.value = newValue;
                },
                markerId: const MarkerId('Selected End Point'),
                position: widget.endPoint.value!,
                infoWindow: const InfoWindow(
                  title: 'Selected End Point',
                ),
                zIndex: 12),
          );
          widget.startPointOnMap.value = true;
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    resetSub?.cancel();
  }

  @override
  void initState() {
    super.initState();
    setMarkerIcons();

    resetSub = widget.startPointOnMap.listen((value) {
      if (!value) {
        updateMarkers(widget.roverMetricsObs.value);
      }
    });

    resetSub = widget.testPiLitLocations.listen((value) {
      updateMarkers(widget.roverMetricsObs.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          onTap: (t) {
            widget.startPointOnMap.value ? setEndMarker(t) : setStartMarker(t);
          },
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

  Set<Marker> getMarkers(RoverGarageState roverGarageState, List<RoverStatePiLit> piLitLocations) {
    Set<Marker> markers = {};

    markers.addAll(piLitLocations.map((piLit) => Marker(
          markerId: MarkerId(piLit.pi_lit_id),
          position: piLit.location.latLng,
          icon: mapMarkerIcon,
          zIndex: 3,
        )));

    if (roverGarageState.garage != null) {
      markers.add(Marker(
        markerId: MarkerId(roverGarageState.garage!.garage_id),
        position: roverGarageState.garage?.location.latLng,
        icon: garageMarkerIcon,
        zIndex: 5,
      ));
    }

    markers.addAll(roverGarageState.pi_lits.deployed_pi_lits.map((piLit) => Marker(
          markerId: MarkerId(piLit.pi_lit_id),
          position: piLit.location.latLng,
          icon: mapMarkerIcon,
          zIndex: 7,
        )));

    markers.add(Marker(
      markerId: MarkerId(roverGarageState.rover_id),
      position: roverGarageState.telemetry.location.latLng,
      icon: roverMarkerIcon,
      zIndex: 10,
    ));

    if (widget.startPoint.value != null) {
      markers.add(
        Marker(
            icon: BitmapDescriptor.defaultMarkerWithHue(115),
            draggable: true,
            onDragEnd: (newValue) {
              widget.startPoint.value = newValue;
            },
            markerId: const MarkerId('Selected Start Point'),
            position: widget.startPoint.value!,
            infoWindow: const InfoWindow(
              title: 'Selected Start Point',
            ),
            zIndex: 12),
      );
      widget.startPointOnMap.value = true;
    }

    if (widget.endPoint.value != null) {
      markers.add(
        Marker(
            draggable: true,
            onDragEnd: (newValue) {
              widget.endPoint.value = newValue;
            },
            markerId: const MarkerId('Selected End Point'),
            position: widget.endPoint.value!,
            infoWindow: const InfoWindow(
              title: 'Selected End Point',
            ),
            zIndex: 12),
      );
    }

    return markers;
  }
}
