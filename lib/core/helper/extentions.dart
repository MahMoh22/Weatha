import 'package:flutter/material.dart';
import 'package:my_weather/core/localization/app_localization.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZerro() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZerro() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension TranslateWhoutArgs on String {
  String tr(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}

extension TranslateWithArg on String {
  String trWithArg(BuildContext context, Map<String, dynamic> args) {
    return AppLocalizations.of(context)!.translateWithArgs(this, args);
  }
}
