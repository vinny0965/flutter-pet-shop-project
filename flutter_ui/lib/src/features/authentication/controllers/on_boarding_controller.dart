import 'package:flutter_ui/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:flutter_ui/src/constants/color.dart';
import 'package:flutter_ui/src/constants/text_strings.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/image_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: tOnBoardingImage1,
            title: tOnBoardingTitle1,
            subTitle: tOnBoardingSubtitle1,
            counterText: tOnBoardingCounter1,
            bgColor: tOnBoardingPage1Color)),
    OnBoardingPageWidget(
        model: OnBoardingModel(
            image: tOnBoardingImage2,
            title: tOnBoardingTitle2,
            subTitle: tOnBoardingSubtitle2,
            counterText: tOnBoardingCounter2,
            bgColor: tOnBoardingPage2Color)),
  ];

  onPageChangeCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  skip() {
    controller.jumpToPage(page: 1);
  }

  animateToNextSlide() {
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
}
