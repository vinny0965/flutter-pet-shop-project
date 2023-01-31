import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/image_strings.dart';
import '../features/authentication/controllers/splash_screen_controller.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key? key,
    required this.durationInMs,
    required this.child,
    this.animatePosition,
  }) : super(key: key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;

  final TAnimatePosition? animatePosition;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top: controller.animate.value
              ? animatePosition!.topAfter
              : animatePosition!.topBefore,
          left: controller.animate.value
              ? animatePosition!.leftAfter
              : animatePosition!.leftBefore,
          bottom: controller.animate.value
              ? animatePosition!.bottonAfter
              : animatePosition!.bottonBefore,
          right: controller.animate.value
              ? animatePosition!.rigthAfter
              : animatePosition!.rigthBefore,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate.value ? 1 : 0,

            child: child,
            // child: Image(image: AssetImage(tSplashImage))
          )),
    );
  }
}
