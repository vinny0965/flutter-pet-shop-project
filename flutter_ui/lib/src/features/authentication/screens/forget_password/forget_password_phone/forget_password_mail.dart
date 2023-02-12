import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/src/constants/sizes.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:get/get.dart';

import '../../../../../common_widgets/form/form_header_widget.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/text_strings.dart';
import '../../../controllers/signup_controller.dart';

class ForgetPasswordPhoneScreen extends StatelessWidget {
  const ForgetPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              SizedBox(
                height: tDefaultSize * 4,
              ),
              const FormHeaderWidget(
                image: tForgetPasswordImage,
                title: tForgetPassword,
                subtitle: "Insira seu número de celular para recuperar a senha",
                crossAxisAlignment: CrossAxisAlignment.center,
                heigthBetween: 30.0,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: tFormHeigth,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.phoneNo,
                        decoration: InputDecoration(
                          label: Text(tPhoneN),
                          hintText: tPhoneN,
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  SignUpController.instance.phoneAuthentication(
                                      controller.phoneNo.text.trim());
                                  Get.to(() => const OTPScreen());
                                }
                              },
                              child: Text("Próximo")))
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
