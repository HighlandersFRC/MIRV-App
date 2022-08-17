import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mirv/models/place.dart';
import 'dart:convert' as convert;
import 'package:mirv/models/searchbox_places.dart';

class PlacesService {
  final key = 'AIzaSyAPNZNjOTshdE86EevJ2dbSxZWI_GNIrhc';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&key=$key';
    try {
      var response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 5),
            onTimeout: () => http.Response('Timeout', 408),
          );
      switch (response.statusCode) {
        case 200:
          var json = convert.jsonDecode(response.body);
          var results = json['predictions'] as List;
          return results.map((place) => PlaceSearch.fromJson(place)).toList();
        case 408:
          Get.snackbar("Timeout", "Places search timed out");
          return [];
        default:
          return [];
      }
    } on SocketException catch (_) {
      Get.snackbar("Internet", "No internet connection");
      return [];
    }
  }

  Future<Place?> getPlace(String placeId) async {
    var url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    try {
      var response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 5),
            onTimeout: () => http.Response('Timeout', 408),
          );
      switch (response.statusCode) {
        case 200:
          var json = convert.jsonDecode(response.body);
          var jsonResult = json['result'] as Map<String, dynamic>;
          return Place.fromJson(jsonResult);
        case 408:
          Get.snackbar("Timeout", "Places search timed out");
          return null;
        default:
          return null;
      }
    } on SocketException catch (_) {
      Get.snackbar("Internet", "No internet connection");
      return null;
    }
  }

  Future<List<Place>> getPlaces(double lat, double lng, String placeType) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key';
    try {
      var response = await http.get(Uri.parse(url)).timeout(
            const Duration(seconds: 5),
            onTimeout: () => http.Response('Timeout', 408),
          );
      switch (response.statusCode) {
        case 200:
          var json = convert.jsonDecode(response.body);
          var jsonResults = json['results'] as List;
          return jsonResults.map((place) => Place.fromJson(place)).toList();
        case 408:
          Get.snackbar("Timeout", "Places search timed out");
          return [];
        default:
          return [];
      }
    } on SocketException catch (_) {
      Get.snackbar("Internet", "No internet connection");
      return [];
    }
  }
}
