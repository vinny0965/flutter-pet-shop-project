import 'package:flutter/material.dart';
import 'package:flutter_ui/src/common_widgets/animation_design.dart';
import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/authentication/controllers/splash_screen_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        TFadeInAnimation(
          durationInMs: 1600,
          animatePosition: TAnimatePosition(
              topAfter: 50,
              topBefore: 50,
              leftAfter: tDefaultSize,
              leftBefore: -80),
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
        TFadeInAnimation(
          durationInMs: 2400,
          animatePosition: TAnimatePosition(
              topAfter: 0, topBefore: 20, leftAfter: 50, leftBefore: 50),
          child: const Image(
            image: AssetImage(tSplashImage),
            width: 500,
          ),
        ),
        TFadeInAnimation(
          durationInMs: 2400,
          animatePosition: TAnimatePosition(
              bottonAfter: 50,
              bottonBefore: 0,
              rigthAfter: tDefaultSize,
              rigthBefore: tDefaultSize),
          child: Container(
            width: tSplashConstainerSize,
            height: tSplashConstainerSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: tPrimaryColor,
            ),
          ),
        ),
        TFadeInAnimation(
          durationInMs: 1600,
          animatePosition: TAnimatePosition(
              topAfter: 10, topBefore: 10, leftAfter: 50, leftBefore: -80),
          child: Column(
            children: [
              Text(
                tAppTagLine,
                style:
                    GoogleFonts.montserrat(color: Colors.black87, fontSize: 25),
              ),
            ],
          ),
        ),
      ]),
    ));
  }
}
