import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/models/place.dart';
import 'package:test/Blocs/autocomplete/application_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/rover_metrics.dart';
import 'package:test/models/searchbox_places.dart';

class RoverSelectionMap extends StatefulWidget {
  final List<RoverMetrics> roverMetrics;
  final Rx<String> selectedRoverId;

  RoverSelectionMap(this.roverMetrics, this.selectedRoverId);

  @override
  _RoverSelectionMapState createState() => _RoverSelectionMapState();
}

class _RoverSelectionMapState extends State<RoverSelectionMap> {
  Set<Marker> markers = new Set();
  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/rover_icon.png');
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

    final applicationBloc = ApplicationBloc();

    locationSubscription =
        applicationBloc.selectedLocation.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name;
        _goToPlace(place);
      } else
        _locationController.text = "";
    });

    applicationBloc.bounds.stream.listen((bounds) async {
      if (_mapController != null) {
        final GoogleMapController controller = _mapController!;
        controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
      }
    });
    super.initState();

    setState(() {
      final String polygonIdVal = 'polygon_id_polygon_1';
      _polygons.add(Polygon(
        polygonId: PolygonId(polygonIdVal),
        points: <LatLng>[
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
    void _setMarkerIcon() async {
      _markerIcon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(), 'assets/images/rover_icon.png');
    }

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

    this.widget.selectedRoverId.listen((roverId) {
      this.widget.roverMetrics.forEach((element) async {
        if (element.roverId == roverId) {
          _mapController?.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  target: LatLng(element.telemetry.location.lat,
                      element.telemetry.location.long),
                  zoom: await _mapController!.getZoomLevel())));
        }
      });
    });
  }

  @override
  void dispose() {
    final applicationBloc = ApplicationBloc();

    applicationBloc.dispose();
    _locationController.dispose();
    locationSubscription.cancel();
    boundsSubscription.cancel();
    super.dispose();
  }

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
    final applicationBloc = ApplicationBloc();

    return Scaffold(
        body: (applicationBloc.currentLocation == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    height: 70,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                            style: DefaultTextStyle.of(context)
                                .style
                                .copyWith(fontStyle: FontStyle.italic),
                            decoration:
                                InputDecoration(border: OutlineInputBorder()),
                          ),
                          suggestionsCallback: (pattern) async {
                            return await applicationBloc.searchPlaces(pattern);
                          },
                          itemBuilder: (context, PlaceSearch suggestion) {
                            return ListTile(
                              title: Text(suggestion.description),
                            );
                          },
                          onSuggestionSelected: (PlaceSearch suggestion) {
                            applicationBloc
                                .setSelectedLocation(suggestion.placeId);
                          },
                        )),
                  ),
                  Container(
                    height: 600.0,
                    child: GoogleMap(
                      mapType: MapType.hybrid,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            applicationBloc.currentLocation!.latitude,
                            applicationBloc.currentLocation!.longitude),
                        zoom: 14,
                      ),
                      markers: getMarkers(),
                      polygons: _polygons,
                      onMapCreated: (GoogleMapController controller) {
                        _mapController = controller;
                      },
                      // markers: Set<Marker>.of(applicationBloc.markers),
                    ),
                  ),
                ],
              ));
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = _mapController!;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry.location.lat, place.geometry.location.lng),
            zoom: 14.0),
      ),
    );
  }

  Set<Marker> getMarkers() {
    //markers to place on map
    setState(() {
      markers = {
        ...this.widget.roverMetrics.map((rover) {
          return Marker(
              //add first marker
              markerId: MarkerId('rover_1'),
              position: LatLng(rover.telemetry.location.lat,
                  rover.telemetry.location.long), //position of marker
              infoWindow: InfoWindow(
                //popup info
                title: 'rover_1',
                snippet: 'My Custom Subtitle',
              ),
              icon: mapMarker,
              onTap: () async {
                _mapController?.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: LatLng(rover.telemetry.location.lat,
                            rover.telemetry.location.long),
                        zoom: await _mapController!.getZoomLevel())));
              });
          //add more markers here
        })
      };
    });
    return markers;
  }
}
