import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:test/models/rover_location.dart';
import 'package:test/models/place.dart';
import 'package:test/Blocs/autocomplete/application_bloc.dart';
import 'package:provider/provider.dart';

class RoverSelectionMap extends StatefulWidget {
  final List<RoverLocation> rovers;
  RoverSelectionMap(this.rovers);

  @override
  _RoverSelectionMapState createState() => _RoverSelectionMapState();
}

class _RoverSelectionMapState extends State<RoverSelectionMap> {
  LatLng _cameraCenterLocation =
      new LatLng(40.47382939771208, -104.96933444375819);

  BitmapDescriptor mapMarker = BitmapDescriptor.defaultMarker;

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/pi_lit_icon.png');

    getMarkers();
  }

  LocationData? _locationData;
  Location location = Location();

  Set<Marker> markers = HashSet<Marker>();
  Set<Polygon> _polygons = HashSet<Polygon>();
  Set<Circle> _circles = HashSet<Circle>();
  List<LatLng> polygonLatLngs = <LatLng>[];
  double radius = 10.0;

  BitmapDescriptor _markerIcon = BitmapDescriptor.defaultMarker;
  GoogleMapController? _googleMapController;
  double zoom = 16.0;

  int _polygonIdCounter = 1;
  int _circleIdCounter = 1;
  int _markerIdCounter = 1;

  bool _isPolygon = true;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
    _checkLocationPermission();

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

    location.onLocationChanged.listen((event) {
      if (event.latitude == null || event.longitude == null) return;
      location.getLocation().then((value) => _locationData = value);
      (_googleMapController?.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(event.latitude!, event.longitude!), zoom: zoom))));
    });
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

  void _checkLocationPermission() async {
    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
    PermissionStatus _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _cameraCenterLocation,
            zoom: 16,
          ),
          onCameraMove: (CameraPosition) => zoom = CameraPosition.zoom,
          zoomGesturesEnabled: true,
          mapType: MapType.hybrid,
          onMapCreated: _onMapCreated,
          markers: markers,
          circles: _circles,
          polygons: _polygons,
          myLocationEnabled: true,
        ),
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: LocationSearchBox(),
        ),
      ],
    ));
  }

  Set<Marker> getMarkers() {
    setState(() {
      markers = {
        ...this.widget.rovers.map((rover) {
          return Marker(
              //add first marker
              markerId: MarkerId(rover.roverId),
              position: rover.location, //position of marker
              infoWindow: InfoWindow(
                //popup info
                title: rover.roverId,
                snippet: 'My Custom Subtitle',
              ),
              icon: mapMarker,
              onTap: () {
                _googleMapController?.animateCamera(
                    CameraUpdate.newCameraPosition(CameraPosition(
                        target: rover.location, zoom: this.zoom)));
              });
        })
      };
    });
    return markers; //add more markers here
  }
}

class LocationSearchBox extends StatelessWidget {
  ApplicationBloc applicationBloc = ApplicationBloc();
  LocationSearchBox({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: 'Enter Your Location',
          suffixIcon: Icon(Icons.search),
          contentPadding: const EdgeInsets.only(left: 20, bottom: 5, right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        onChanged: (value) => applicationBloc.searchPlaces(value),
        onTap: () => applicationBloc.clearSelectedLocation(),
      ),
    );
  }
}
