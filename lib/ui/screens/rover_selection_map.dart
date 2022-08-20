// ignore_for_file: non_constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/constants/settings_default.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/rover/rover_garage_state.dart';
import 'package:mirv/models/device_status_type.dart';
import 'package:mirv/models/rover/rover_state.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';

class RoverSelectionMap extends StatefulWidget {
  final List<RoverState> roverStates;
  final Rx<String> selectedRoverId;
  final SelectedRoverController selectedRoverController;
  final Rx<String> selectedMarkerId = "".obs;

  RoverSelectionMap(this.roverStates, this.selectedRoverId, this.selectedRoverController, {Key? key}) : super(key: key);

  @override
  State<RoverSelectionMap> createState() => _RoverSelectionMapState();
}

class _RoverSelectionMapState extends State<RoverSelectionMap> {
  Set<Marker> markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarkerWithHue(20);
  RxList<RoverGarageState> roverList = <RoverGarageState>[].obs;
  Rx<String> selectedRoverId = "".obs;
  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/rover_icon_new.png');
  }

  GoogleMapController? _mapController;
  late StreamSubscription locationSubscription;
  late StreamSubscription boundsSubscription;

  double radius = 10.0;
  StreamController<Place?> selectedLocation = StreamController<Place?>();
  double zoom = 14.0;

  @override
  void initState() {
    super.initState();
    setCustomMarker();

    widget.selectedRoverController.searchSelect.listen((place) async {
      if (_mapController != null && place != null) {
        _mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: place.geometry.getLatLng(), zoom: await _mapController!.getZoomLevel())));
      }
    });

    widget.selectedRoverId.listen((rover_id) {
      widget.roverStates.forEach((element) async {
        if (element.rover_id == rover_id) {
          _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(element.telemetry.location.lat, element.telemetry.location.long),
              zoom: await _mapController!.getZoomLevel())));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var firstRover = widget.roverStates.firstWhereOrNull((val) => true);
    var lat = firstRover?.telemetry.location.lat ?? 40.474019;
    var long = firstRover?.telemetry.location.long ?? -104.969627;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: zoom,
        ),
        markers: getMarkers(),
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }

  Set<Marker> getMarkers() {
    setState(() {
      markers = {
        ...widget.roverStates.map((rover) {
          return Marker(
              markerId: MarkerId(rover.rover_id),
              position: LatLng(rover.telemetry.location.lat, rover.telemetry.location.long),
              infoWindow: InfoWindow(
                title: rover.rover_id,
              ),
              icon: mapMarker,
              onTap: () {
                rover.status == DeviceStatusType.unavailable
                    ? null
                    :
                    // widget.selectedMarkerId.value = rover.rover_id;
                    widget.selectedRoverController.setSelectedRoverId(rover.rover_id);
              });
        })
      };
    });
    return markers;
  }
}
