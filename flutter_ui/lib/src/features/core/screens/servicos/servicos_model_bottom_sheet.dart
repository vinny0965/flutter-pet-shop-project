import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_email/forget_password_mail.dart';
import 'package:flutter_ui/src/features/core/controllers/agendamento_controller.dart';
import 'package:flutter_ui/src/features/core/models/agendamento_model.dart';
import 'package:flutter_ui/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../../authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import '../../models/user_model.dart';

class ServicosBottonSheet {
  static Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, String tipo, String valor) {
    final controller = Get.put(AgendamentoController());
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
                              controller: controller.data,
                              decoration: const InputDecoration(
                                  label: Text("Data"),
                                  prefixIcon: Icon(Icons.calendar_month)),
                            ),
                            const SizedBox(
                              height: tFormHeigth - 20,
                            ),
                            TextFormField(
                              controller: controller.horario,
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
                                    final agendamento = AgendamentoModel(
                                        data: controller.data.text.trim(),
                                        horario: controller.horario.text.trim(),
                                        servico: tipo,
                                        valor: valor);
                                    AgendamentoController.instance
                                        .createAgendamento(agendamento);
                                    Get.back();
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
