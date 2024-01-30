// ignore_for_file: type=lint

import 'package:flutter/material.dart';

class AppColors {
  static const Color burgundy = Color(0xFFA11421);
  static const Color secondary = Color(0xFF1E253A);
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color lightGrey = Color(0xFFE5E2DF);
  static const Color offWhite = Color(0xFFF3EBDF);
  static const Color yellow = Color(0xFFE8B644);
  static const Color orange = Color(0xFFE38000);
  static const Color brand = Color(0xFFEB382A);
  static const Color purple = Color(0xFF84034C);
  static const Color colorD2DAE2 = Color(0xFFD2DAE2);
  static const Color color6DA92F = Color(0xFF6DA92F);
  static const Color error = brand;

  static const Color primary = burgundy;

  static MaterialColor red = MaterialColor(primary.value, const {
    100: Color(0xFFFFFAFA),
    200: Color(0xFFFFF3F2),
    300: Color(0xFFFFEDEC),
    400: Color(0xFFFFDCD9),
    500: Color(0xFFED5044),
    600: brand,
    700: Color(0xFFD83427),
  });

  static MaterialColor grey = const MaterialColor(0xFF99A2AD, {
    100: Color(0xFFF8F8F8),
    200: Color(0xFFF2F4F6),
    300: Color(0xFFE8EDF2),
    400: Color(0xFFD2DAE2),
    500: Color(0xFF99A2AD),
    600: Color(0xFF696F7E),
    700: secondary,
  });

  static MaterialColor success = const MaterialColor(0xFF00BA88, {
    50: Color(0xFFF4FFEA),
    100: Color(0xFFB4DD80),
    200: Color(0xFF72AB33),
    300: Color(0xFF5A9717),
  });

  static Color titleAndLabel = grey[700]!;
  static Color bodyCopyText = grey[600]!;
  static Color title = primary;

  static ColorFilter suffixIconColorFilter({bool enabled = true}) =>
      ColorFilter.mode(
        enabled ? grey[500]! : grey[400]!,
        BlendMode.srcIn,
      );
}
