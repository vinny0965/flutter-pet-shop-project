import 'package:flutter_ui/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter_ui/src/features/authentication/screens/welcome/welcome.dart';
import 'package:get/get.dart';

class SplashScreeController extends GetxController {
  static SplashScreeController get find => Get.find();
  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(OnBoardingScreen());
    // Navigator.pushReplacement(
    //     cont'ext, MaterialPageRoute(builder: (context) => Welcome()));
  }
}
