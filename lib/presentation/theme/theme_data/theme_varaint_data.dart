
import 'package:flutter/material.dart';
import '/extensions/extension.dart';
import '/utils/utils.dart';

import '../theme.dart';

final themeVariantData = {
  ThemeVariant.light: ThemeData(
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    primaryColor: tempColor.lightBlueColor,
    disabledColor: tempColor.disablelightColor,
    scaffoldBackgroundColor: tempColor.backgroundColor
  ),
  ThemeVariant.dark: ThemeData(
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    primaryColor: tempColor.purpleColor,
    disabledColor: tempColor.disableDarkColor
  ),
};