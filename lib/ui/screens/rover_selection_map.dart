import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/rover_metrics.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';

class RoverSelectionMap extends StatefulWidget {
  final List<RoverMetrics> roverMetrics;
  final Rx<String> selectedRoverId;
  final SelectedRoverController selectedRoverController;

  const RoverSelectionMap(this.roverMetrics, this.selectedRoverId, this.selectedRoverController, {Key? key}) : super(key: key);

  @override
  State<RoverSelectionMap> createState() => _RoverSelectionMapState();
}

class _RoverSelectionMapState extends State<RoverSelectionMap> {
  Set<Marker> markers = {};
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(const ImageConfiguration(), 'assets/images/rover_icon.png');
  }

  LocationData? _locationData;
  Location location = Location();
  GoogleMapController? _mapController;
  late StreamSubscription locationSubscription;
  late StreamSubscription boundsSubscription;
  final _locationController = TextEditingController();

  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();
  List<LatLng> polygonLatLngs = <LatLng>[];
  double radius = 10.0;
  StreamController<Place?> selectedLocation = StreamController<Place?>();

  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  double zoom = 16.0;

  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  bool _isPolygon = true;

  @override
  void initState() {
    super.initState();
    setCustomMarker();

    locationSubscription = selectedLocation.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name;
        _goToPlace(place);
      } else {
        _locationController.text = "";
      }
    });

    widget.selectedRoverController.searchSelect.listen((place) async {
      if (_mapController != null && place != null) {
        _mapController?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: place.geometry.getLatLng(), zoom: await _mapController!.getZoomLevel())));
      }
    });

    widget.selectedRoverId.listen((p0) => print(p0));

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

    void _setPolygon() {
      final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
      _polygons.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: polygonLatLngs,
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ));
    }

    widget.selectedRoverId.listen((roverId) {
      widget.roverMetrics.forEach((element) async {
        if (element.roverId == roverId) {
          _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
              target: LatLng(element.telemetry.location.lat, element.telemetry.location.long),
              zoom: await _mapController!.getZoomLevel())));
        }
      });
    });
  }

  @override
  void _setPolygon() {
    final String polygonIdVal = 'polygon_id_$_polygonIdCounter';
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: polygonLatLngs,
      strokeWidth: 2,
      strokeColor: Colors.yellow,
      fillColor: Colors.yellow.withOpacity(0.15),
    ));
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
        myLocationEnabled: true,
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 14,
        ),
        markers: getMarkers(),
        polygons: _polygons,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
        // markers: Set<Marker>.of(applicationBloc.markers),
      ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = _mapController!;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(place.geometry.location.lat, place.geometry.location.lng), zoom: 14.0),
      ),
    );
  }

  Set<Marker> getMarkers() {
    //markers to place on map
    setState(() {
      markers = {
        ...widget.roverMetrics.map((rover) {
          return Marker(
              //add first marker
              markerId: MarkerId(rover.roverId),
              position: LatLng(rover.telemetry.location.lat, rover.telemetry.location.long), //position of marker
              infoWindow: InfoWindow(
                //popup info
                title: rover.roverId,
                snippet: 'My Custom Subtitle',
              ),
              icon: mapMarker,
              onTap: () async {
                _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                    target: LatLng(rover.telemetry.location.lat, rover.telemetry.location.long),
                    zoom: await _mapController!.getZoomLevel())));
              });
          //add more markers here
        })
      };
    });
    return markers;
  }
}
