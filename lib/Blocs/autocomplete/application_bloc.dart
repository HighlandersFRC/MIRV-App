import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test/models/searchbox_places.dart';
import 'package:test/services/geolocator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/services/places_service.dart';
import 'package:test/models/place.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';

// import 'package:test/models/geometry.dart';
// import 'package:test/models/location.dart';

class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();

  Position? currentLocation;
  List<PlaceSearch> searchResults = [];
  StreamController<Place?> selectedLocation = StreamController<Place?>();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String? placeType;

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    notifyListeners();
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedLocation.add(sLocation);
    selectedLocationStatic = sLocation;
    searchResults = [];
    notifyListeners();
  }

  clearSelectedLocation() {
    selectedLocation.add(null);
    selectedLocationStatic = null;
    searchResults = [];
    placeType = null;
    notifyListeners();
  }
}
