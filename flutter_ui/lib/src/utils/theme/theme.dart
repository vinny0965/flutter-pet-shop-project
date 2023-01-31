import 'package:flutter/material.dart';
import 'package:flutter_ui/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter_ui/src/utils/theme/widget_themes/outlined_button_theme.dart';

import 'package:flutter_ui/src/utils/theme/widget_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static final ThemeData ligthTheme = ThemeData(
      brightness: Brightness.light,
      textTheme: TTextTheme.ligthTextTeme,
      outlinedButtonTheme: TOutlinedButtonTheme.ligthOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.ligthElevatedButtonTheme);

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      textTheme: TTextTheme.darkTextTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme);
}
