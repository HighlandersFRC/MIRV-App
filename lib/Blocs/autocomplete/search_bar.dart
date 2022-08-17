import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mirv/models/place.dart';
import 'package:mirv/models/searchbox_places.dart';
import 'package:mirv/services/places_service.dart';
import 'package:mirv/ui/screens/rover_selection_page.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final SelectedRoverController selectedRoverController;
  final TextEditingController typeAheadController;

  SearchBar({Key? key, required this.selectedRoverController, required this.typeAheadController}) : super(key: key);

  final placesService = PlacesService();

  Rx<String> searchBarText = Rx<String>('');
  List<PlaceSearch> searchResults = [];
  StreamController<Place?> selectedLocation = StreamController<Place?>();
  StreamController<LatLngBounds> bounds = StreamController<LatLngBounds>();
  Place? selectedLocationStatic;
  String? placeType;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
          // Obx(() => (
          // (currentLocation.value == null)
          //   ? const Center(
          //       child: CircularProgressIndicator(),
          //     )
          //   :
          Column(children: [
        SizedBox(
          height: 70,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TypeAheadField(
                  textFieldConfiguration: TextFieldConfiguration(
                      autofocus: false,
                      style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                      controller: typeAheadController),
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
                    searchBarText.value = suggestion.description;
                    typeAheadController.text = searchBarText.value;
                  })),
        )
      ]),
    );
  }
}
