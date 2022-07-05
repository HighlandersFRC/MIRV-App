import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test/models/place.dart';
import 'package:test/models/searchbox_places.dart';
import 'package:test/services/geolocator_service.dart';
import 'package:test/services/places_service.dart';
import 'package:test/ui/screens/rover_selection_page.dart';

class SearchBar extends StatelessWidget {
  final SelectedRoverController selectedRoverController;

  SearchBar({Key? key, required this.selectedRoverController})
      : super(key: key);

  final geoLocatorService = GeolocatorService();
  final placesService = PlacesService();

  Position getCurrentLocation;
  List<PlaceSearch> searchResults = [];
  StreamController<Place?> selectedLocation = StreamController<Place?>();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String? placeType;

  setCurrentLocation() async {
    currentLocation = await geoLocatorService.getCurrentLocation();
  }

  Future<List<PlaceSearch>> searchPlaces(String searchTerm) async {
    searchResults = await placesService.getAutocomplete(searchTerm);
    return searchResults;
  }

  setSelectedLocation(String placeId) async {
    var sLocation = await placesService.getPlace(placeId);
    selectedRoverController.searchSelect.value = sLocation;
  }

  clearSelectedLocation() {
    selectedLocation.add(null);
    selectedLocationStatic = null;
    searchResults = [];
    placeType = null;
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // (currentLocation == null)
          //     ?  const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          Column(children: [
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
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  suggestionsCallback: (pattern) async {
                    return await searchPlaces(pattern);
                  },
                  itemBuilder: (context, PlaceSearch suggestion) {
                    return ListTile(
                      title: Text(suggestion.description),
                    );
                  },
                  onSuggestionSelected: (PlaceSearch suggestion) {
                    setSelectedLocation(suggestion.placeId);
                  })),
        ),
      ]),
    );
  }
}
