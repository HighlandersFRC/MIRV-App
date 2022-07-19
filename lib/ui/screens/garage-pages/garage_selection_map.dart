import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/garage/garage_metrics.dart';
import 'package:mirv/models/garage/garage_status_type.dart';
import 'package:mirv/ui/screens/garage-pages/garage-selection-page.dart';

class GarageSelectionMap extends StatefulWidget {
  final List<GarageMetrics> garageMetrics;
  final Rx<String> selectedGarageId;
  final SelectedGarageController selectedGarageController;
  final Rx<String> selectedMarkerId = "".obs;

  GarageSelectionMap(this.garageMetrics, this.selectedGarageId, this.selectedGarageController, {Key? key}) : super(key: key);

  @override
  State<GarageSelectionMap> createState() => _GarageSelectionMapState();
}

class _GarageSelectionMapState extends State<GarageSelectionMap> {
  Set<Marker> markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;
  RxList<GarageMetrics> garageList = <GarageMetrics>[].obs;
  Rx<String> selectedGarageId = "".obs;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/garage_icon.png');
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

    widget.selectedGarageController.searchSelect.listen((place) async {
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

    widget.selectedGarageId.listen((garageId) {
      widget.garageMetrics.forEach((element) async {
        if (element.garageId == garageId) {
          _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(element.location.lat, element.location.long), zoom: await _mapController!.getZoomLevel())));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var firstGarage = widget.garageMetrics.firstWhereOrNull((val) => true);
    var lat = firstGarage?.location.lat ?? 40.5;
    var long = firstGarage?.location.long ?? -105;
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
        ...widget.garageMetrics.map((garage) {
          return Marker(
              markerId: MarkerId(garage.garageId),
              position: LatLng(garage.location.lat, garage.location.long),
              infoWindow: InfoWindow(
                title: garage.garageId,
              ),
              icon: mapMarker,
              onTap: () {
                garage.status == GarageStatusType.unavailable
                    ? null
                    :
                    // widget.selectedMarkerId.value = garage.garageId;
                    widget.selectedGarageController.setSelectedGarageId(garage.garageId);
              });
        })
      };
    });
    return markers;
  }
}
