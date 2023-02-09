import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter_ui/src/features/authentication/models/user_model.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:get/get.dart';

import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeigth - 10),
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller.fullName,
                decoration: const InputDecoration(
                    label: Text(tFullName),
                    prefixIcon: Icon(Icons.person_outline_rounded)),
              ),
              const SizedBox(
                height: tFormHeigth - 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                    label: Text(tEmail), prefixIcon: Icon(Icons.email_rounded)),
              ),
              const SizedBox(
                height: tFormHeigth - 20,
              ),
              TextFormField(
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    label: Text(tPhoneN), prefixIcon: Icon(Icons.numbers)),
              ),
              const SizedBox(
                height: tFormHeigth - 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                    label: Text(tSenha), prefixIcon: Icon(Icons.fingerprint)),
              ),
              const SizedBox(
                height: tFormHeigth - 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // SignUpController.instance.registerUser(
                        //     controller.email.text.trim(),
                        //     controller.password.text.trim());
                        // SignUpController.instance.phoneAuthentication(
                        //     controller.phoneNo.text.trim());
                        // Get.to(() => const OTPScreen());
                        final user = UserModel(
                            fullName: controller.fullName.text.trim(),
                            email: controller.email.text.trim(),
                            phoneNo: controller.phoneNo.text.trim(),
                            password: controller.password.text.trim());
                        SignUpController.instance.createUser(user);
                      }
                    },
                    child: Text(tSignUp.toUpperCase())),
              )
            ],
          )),
    );
  }
}
