import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test/models/searchbox_places.dart';
import 'package:test/services/geolocator_service.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/services/places_service.dart';
import 'package:test/services/marker_service.dart';
import 'package:test/models/place.dart';
import 'dart:async';
import 'package:flutter/foundation.dart';


class ApplicationBloc with ChangeNotifier {
  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();
  final markerService = MarkerService();

  Position? currentLocation;
  List<PlaceSearch> searchResults = [];
  StreamController<Place?> selectedLocation = StreamController<Place?>();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String? placeType;
  List<Marker> markers = <Marker>[];

  ApplicationBloc() {
    setCurrentLocation();
  }

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
    notifyListeners();
  }

  Future<List<PlaceSearch>> searchPlaces(String searchTerm) async{
    searchResults = await placesService.getAutocomplete(searchTerm);
    return searchResults;
    
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

  togglePlaceType(String value, bool selected) async {
    if (selected) {
      placeType = value;
    } else {
      placeType = null;
    }

    if (placeType != null) {
      var places = await placesService.getPlaces(
          selectedLocationStatic!.geometry.location.lat,
          selectedLocationStatic!.geometry.location.lng,
          placeType!);
      markers = [];
      if (places.length > 0) {
        var newMarker = markerService.createMarkerFromPlace(places[0], false);
        markers.add(newMarker);
      }

      var locationMarker =
          markerService.createMarkerFromPlace(selectedLocationStatic!, true);
      markers.add(locationMarker);

      var _bounds = markerService.bounds(Set<Marker>.of(markers));
      bounds.add(_bounds!);

      notifyListeners();
    }
  }

  @override
  void dispose() {
    selectedLocation.close();
    bounds.close();
    super.dispose();
  }
}
