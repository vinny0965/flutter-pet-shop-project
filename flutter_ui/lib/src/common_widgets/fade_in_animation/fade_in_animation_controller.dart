import 'package:flutter_ui/src/features/authentication/screens/on_boarding/on_boarding_screen.dart';
import 'package:flutter_ui/src/features/authentication/screens/welcome/welcome.dart';
import 'package:get/get.dart';

class FadeInAnimationController extends GetxController {
  static FadeInAnimationController get find => Get.find();
  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;
    await Future.delayed(Duration(milliseconds: 5000));
    animate.value = false;
    await Future.delayed(Duration(milliseconds: 2000));
    Get.offAll(() => const Welcome());
    // Navigator.pushReplacement(
    //     cont'ext, MaterialPageRoute(builder: (context) => Welcome()));
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate.value = true;

    // Navigator.pushReplacement(
    //     cont'ext, MaterialPageRoute(builder: (context) => Welcome()));
  }
}
