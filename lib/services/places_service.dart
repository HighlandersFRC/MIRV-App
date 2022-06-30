import 'package:http/http.dart' as http;
import 'package:test/models/place.dart';
import 'dart:convert' as convert;
import 'package:test/models/searchbox_places.dart';

class PlacesService {
  final key = 'AIzaSyAPNZNjOTshdE86EevJ2dbSxZWI_GNIrhc';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body); 
    print(response.body);
    var jsonResults = json['predictions'] as List;
    //var pdfText= await json.decode(json.encode(response.body));
    //var data=json.decode(json.encode(snapshot.data));  
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();

  }

  Future<Place> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  Future<List<Place>> getPlaces(
      double lat, double lng, String placeType) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?location=$lat,$lng&type=$placeType&rankby=distance&key=$key';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['results'] as List;
    return jsonResults.map((place) => Place.fromJson(place)).toList();
  }
}