import 'package:flutter/material.dart';
import 'package:flutter_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class SiginController extends GetxController {
  static SiginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void loginUser(String email, String password) {
    AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password);
  }
}
