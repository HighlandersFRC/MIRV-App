class LocationObject {
  final double lat;
  final double lng;

  LocationObject({required this.lat, required this.lng});

  factory LocationObject.fromJson(Map<dynamic, dynamic> parsedJson) {
    return LocationObject(lat: parsedJson['lat'], lng: parsedJson['lng']);
  }
}
