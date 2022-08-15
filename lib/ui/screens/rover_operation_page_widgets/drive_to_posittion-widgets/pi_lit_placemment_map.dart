import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';

class DriveToLocationMap extends StatefulWidget {
  final Rx<RoverGarageState> roverMetricsObs;
  final Rx<LatLng?> startPoint;
  final Rx<bool> startPointOnMap;

  DriveToLocationMap(
    this.roverMetricsObs,
    this.startPoint,
    this.startPointOnMap, {
    Key? key,
  }) : super(key: key);

  @override
  State<DriveToLocationMap> createState() => _DriveToLocationMapState();
}

class _DriveToLocationMapState extends State<DriveToLocationMap> {
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

  setStartMarker(LatLng tappedPoint) {
    widget.startPoint.value = tappedPoint;
    print('OBS  ${widget.startPoint.value}, ACT $tappedPoint');
    setState(
      () {
        if (widget.startPoint.value != null) {
          markers.add(
            Marker(
              draggable: true,
              onDragEnd: (newValue) {
                widget.startPoint.value = newValue;
              },
              markerId: const MarkerId('Selected Start Point'),
              position: widget.startPoint.value!,
              infoWindow: const InfoWindow(
                title: 'Selected Start Point',
              ),
            ),
          );
          widget.startPointOnMap.value = true;
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    setMarkerIcons();

    widget.roverMetricsObs.listen((roverGarageState) {
      updateMarkers(roverGarageState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          onTap: (t) {
            setStartMarker(t);
          },
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
