import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ui/src/common_widgets/animation_design.dart';
import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/image_strings.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:flutter_ui/src/features/authentication/screens/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var heigth = mediaQuery.size.height;
    var brightbess = mediaQuery.platformBrightness;
    final isDarkMode = brightbess == Brightness.dark;

    return Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tColorInicial,
        body: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1200,
              animatePosition: TAnimatePosition(
                  bottonAfter: 0,
                  bottonBefore: -100,
                  leftAfter: 0,
                  leftBefore: 0,
                  topAfter: 0,
                  topBefore: 0,
                  rigthAfter: 0,
                  rigthBefore: 0),
              child: Container(
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(tWelcomeSreenImage),
                      height: heigth * 0.6,
                    ),
                    Column(
                      children: [
                        Text(
                          tWelcomeTitle,
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          tWelcomeSubtitle,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                              onPressed: () {
                                Get.to(const LoginScreen());
                              },
                              child: Text(tLogin.toUpperCase())),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(tSignUp.toUpperCase())),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
