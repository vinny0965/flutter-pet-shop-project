import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_email/forget_password_mail.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import '../../models/user_model.dart';

class ServicosBottonSheet {
  static Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, String tipo) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return showModalBottomSheet(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Agendamento",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    "Agende Agora mesmo seu serviço!",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(tipo),
                  const SizedBox(
                    height: 11.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: tFormHeigth - 20),
                    child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: controller.fullName,
                              decoration: const InputDecoration(
                                  label: Text("Data"),
                                  prefixIcon: Icon(Icons.calendar_month)),
                            ),
                            const SizedBox(
                              height: tFormHeigth - 20,
                            ),
                            TextFormField(
                              controller: controller.email,
                              decoration: const InputDecoration(
                                  label: Text("Horário"),
                                  prefixIcon: Icon(Icons.timer)),
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
                                        fullName:
                                            controller.fullName.text.trim(),
                                        email: controller.email.text.trim(),
                                        phoneNo: controller.phoneNo.text.trim(),
                                        password:
                                            controller.password.text.trim());
                                    SignUpController.instance.createUser(user);
                                  }
                                },
                                child: const Text("Agendar"),
                                style: ElevatedButton.styleFrom(
                                  side: BorderSide.none,
                                  shape: const StadiumBorder(),
                                ),
                              ),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ));
  }
}
