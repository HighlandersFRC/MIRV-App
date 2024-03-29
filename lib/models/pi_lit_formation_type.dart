// ignore_for_file: constant_identifier_names

enum PiLitFormationType { taper_right_3, taper_left_3, taper_right_5, taper_left_5, spear_7 }

extension PiLitFormationType1 on PiLitFormationType {
  int get piLitsRequired {
    switch (this) {
      case PiLitFormationType.taper_right_5:
        return 5;
      case PiLitFormationType.taper_left_5:
        return 5;
      case PiLitFormationType.spear_7:
        return 7;
      case PiLitFormationType.taper_right_3:
        return 3;
      case PiLitFormationType.taper_left_3:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case PiLitFormationType.spear_7:
        return 'Spear 7';
      case PiLitFormationType.taper_right_5:
        return 'Taper Right 5';
      case PiLitFormationType.taper_left_5:
        return 'Taper Left 5';
      case PiLitFormationType.taper_right_3:
        return 'Taper Right 3';
      case PiLitFormationType.taper_left_3:
        return 'Taper Left 3';
    }
  }
}
