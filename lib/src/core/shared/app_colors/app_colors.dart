import 'package:flutter/material.dart';

import '../../../features/pokemon_list_view/domain/enum_stats.dart';

class AppColors {
  var kPrimaryColor = themeColors[0];
  static const kSecondaryColor = Color.fromRGBO(0, 0, 0, 1);
  static const kWhiteColor = Colors.white;
  static const kGreyColor = Color.fromRGBO(238, 238, 238, 1);
}

List<Color> themeColors = [
  const Color.fromRGBO(232, 83, 130, 1),
  Colors.lightBlueAccent,
  Colors.amberAccent,
];


Color colorTheme(SelectedTheme selectedTheme) {
  if (selectedTheme == SelectedTheme.secondary) {
    return themeColors[1];
  }
  if(selectedTheme == SelectedTheme.tertiary) {
    return themeColors[2];
  }
  return themeColors[0];
}