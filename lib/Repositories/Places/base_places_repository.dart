import 'package:test/models/searchbox_places.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceSearch>?> getAutocomplete(String searchInput) async {}
}
