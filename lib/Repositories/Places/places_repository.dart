import 'package:mirv/models/searchbox_places.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesRepository {
  final String key = 'AIzaSyDnVF4wZWvY3vq3vz1Ogv2Vib3_qEy02pM';
  final String types = 'geocode';

  Future<List<PlaceSearch>> getAutocomplete(String searchInput) async {
    final String url = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
