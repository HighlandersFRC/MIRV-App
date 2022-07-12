import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'pi_lit.freezed.dart';

@freezed
class PiLit with _$PiLit {
  const factory PiLit({required String id, required LatLng location, required String description}) = _PiLit;
}
