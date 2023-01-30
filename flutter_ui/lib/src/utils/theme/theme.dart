import 'package:flutter/material.dart';

import 'package:flutter_ui/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData ligthTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.ligthTextTeme,
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );

  static ThemeData darkTheme = ThemeData(brightness: Brightness.dark);
}
