import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/models/rover_status_type.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';

class RoverSelectionMap extends StatefulWidget {
  final List<RoverMetrics> roverMetrics;
  final Rx<String> selectedRoverId;
  final SelectedRoverController selectedRoverController;
  final Rx<String> selectedMarkerId = "".obs;

  RoverSelectionMap(this.roverMetrics, this.selectedRoverId, this.selectedRoverController, {Key? key}) : super(key: key);

  @override
  State<RoverSelectionMap> createState() => _RoverSelectionMapState();
}

class _RoverSelectionMapState extends State<RoverSelectionMap> {
  Set<Marker> markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  RxList<RoverMetrics> roverList = <RoverMetrics>[].obs;
  Rx<String> selectedRoverId = "".obs;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/rover_icon.png');
  }

  GoogleMapController? _mapController;
  late StreamSubscription locationSubscription;
  late StreamSubscription boundsSubscription;

  Set<Polygon> _polygons = HashSet<Polygon>();
  List<LatLng> polygonLatLngs = <LatLng>[];
  double radius = 10.0;
  StreamController<Place?> selectedLocation = StreamController<Place?>();
  double zoom = 16.0;

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

    setState(() {
      const String polygonIdVal = 'polygon_id_polygon_1';
      _polygons.add(Polygon(
        polygonId: const PolygonId(polygonIdVal),
        points: const <LatLng>[
          LatLng(40.47395664499516, -104.96979609131813),
          LatLng(40.4738780911155, -104.96969819068909),
          LatLng(40.47413619637505, -104.96932670474051),
          LatLng(40.47420760872223, -104.9694299697876),
          LatLng(40.47395664499516, -104.96979609131813),
        ],
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ));
    });

    widget.selectedRoverId.listen((rover_id) {
      widget.roverMetrics.forEach((element) async {
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
    var firstRover = widget.roverMetrics.firstWhereOrNull((val) => true);
    var lat = firstRover?.telemetry.location.lat ?? 40.5;
    var long = firstRover?.telemetry.location.long ?? -105;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 14,
        ),
        markers: getMarkers(),
        polygons: _polygons,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }

  Set<Marker> getMarkers() {
    setState(() {
      markers = {
        ...widget.roverMetrics.map((rover) {
          return Marker(
              markerId: MarkerId(rover.rover_id),
              position: LatLng(rover.telemetry.location.lat, rover.telemetry.location.long),
              infoWindow: InfoWindow(
                title: rover.rover_id,
              ),
              icon: mapMarker,
              onTap: () {
                rover.status == RoverStatusType.unavailable
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
