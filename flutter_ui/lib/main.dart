import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter_ui/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:flutter_ui/src/utils/theme/theme.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: TAppTheme.ligthTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );
  }
}
