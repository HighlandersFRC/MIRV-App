import 'package:test/models/location.dart';

class Geometry {
  final LocationObject location;

  Geometry({required this.location});

  Geometry.fromJson(Map<dynamic, dynamic> parsedJson)
      : location = LocationObject.fromJson(parsedJson['location']);
}
