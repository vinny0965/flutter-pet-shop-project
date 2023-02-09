import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/authentication/models/user_model.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:flutter_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_ui/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel userMode) async {
    await userRepo.createUser(userMode);
    // phoneAuthentication(userMode.phoneNo);
    registerUser(userMode.email, userMode.password);
    // Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNumber) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNumber);
  }
}
