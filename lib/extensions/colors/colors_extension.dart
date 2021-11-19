import 'package:flutter/material.dart';

extension AppColor on Color {
  Color get whiteColor => const Color.fromRGBO(255, 255, 255, 1);
  Color get offWhiteColor => const Color.fromRGBO(245, 245, 245, 1);
  Color get blackColor => const Color.fromRGBO(35, 31, 32, 1);
  Color get greyColor => const Color.fromRGBO(103, 106, 119, 1);
  Color get lightGreyColor => const Color.fromRGBO(220, 220, 220, 1);
  Color get redColor => const Color.fromRGBO(236, 28, 36, 1);
  Color get blueColor => const Color.fromRGBO(2, 128, 253, 1);
  Color get lightBlueColor => const Color.fromRGBO(72, 149, 255, 1);
  Color get robinEggBlueColor => const Color.fromRGBO(1, 191, 204, 1);
  Color get purpleColor => const Color.fromRGBO(107, 122, 254, 1);
  Color get lightPurpleColor => const Color.fromRGBO(107, 141, 254, 1);
  Color get backgroundColor => const Color.fromRGBO(244, 247, 254, 1);
  Color get disableDarkColor => const Color.fromRGBO(107, 141, 254, 0.8);
  Color get disablelightColor => const Color.fromRGBO(72, 149, 255, 0.8);
}
