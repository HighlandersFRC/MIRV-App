import 'dart:io';

import 'package:mirv/models/searchbox_places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../../main.dart';

class PlacesRepository {
  final String key = 'AIzaSyDnVF4wZWvY3vq3vz1Ogv2Vib3_qEy02pM';
  final String types = 'geocode';

  Future<List<PlaceSearch>> getAutocomplete(String searchInput) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    try {
      var response = await http
          .get(
            Uri.parse(url),
          )
          .timeout(
            const Duration(seconds: 5),
            onTimeout: () => http.Response('Timeout', 408),
          );
      switch (response.statusCode) {
        case 200:
          var json = convert.jsonDecode(response.body);
          var results = json['predictions'] as List;
          return results.map((place) => PlaceSearch.fromJson(place)).toList();
        case 408:
          notificationController.queueNotification("Timeout", "Places search timed out");
          return [];
        default:
          return [];
      }
    } on SocketException catch (_) {
      notificationController.queueNotification("Internet", "No internet connection");
      return [];
    }
  }
}
