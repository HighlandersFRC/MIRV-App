import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


part 'rover_location.freezed.dart';


@freezed
class RoverLocation with _$RoverLocation {
  const factory RoverLocation(
      {@Default("unknown") String roverId,
      required LatLng location,
     }) = _RoverLocation;

}
