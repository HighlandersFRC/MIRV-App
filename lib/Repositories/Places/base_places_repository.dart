import 'package:test/models/searchbox_places.dart';


abstract class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput) async{
    
  }
}