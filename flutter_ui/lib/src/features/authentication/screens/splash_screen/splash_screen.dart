import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final splashScreeController = Get.put(SplashScreeController());

  @override
  Widget build(BuildContext context) {
    splashScreeController.startAnimation();
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: splashScreeController.animate.value ? 0 : -30,
            left: splashScreeController.animate.value ? 0 : -30,
            child: Image(image: AssetImage(tSplashTopIcon)),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 20,
            left: splashScreeController.animate.value ? tDefaultSize : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: splashScreeController.animate.value ? 1 : 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ],
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: -50,
              top: splashScreeController.animate.value ? 0 : -30,
              left: splashScreeController.animate.value ? 0 : -30,
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: splashScreeController.animate.value ? 1 : 0,
                  child: Image(image: AssetImage(tSplashImage)))),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: splashScreeController.animate.value ? 50 : 0,
            right: tDefaultSize,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2000),
              opacity: splashScreeController.animate.value ? 1 : 0,
              child: Container(
                width: tSplashConstainerSize,
                height: tSplashConstainerSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor,
                ),
              ),
            ),
          ),
        ),
        Obx(
          () => AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 10,
            left: splashScreeController.animate.value ? 50 : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: splashScreeController.animate.value ? 1 : 0,
              child: Column(
                children: [
                  Text(
                    tAppTagLine,
                    style: GoogleFonts.montserrat(
                        color: Colors.black87, fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
