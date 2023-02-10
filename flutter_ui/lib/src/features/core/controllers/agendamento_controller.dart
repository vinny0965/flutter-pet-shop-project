import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/core/models/agendamento_model.dart';
import 'package:flutter_ui/src/features/core/models/user_model.dart';
import 'package:flutter_ui/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:flutter_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_ui/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class AgendamentoController extends GetxController {
  static AgendamentoController get instance => Get.find();

  final data = TextEditingController();
  final horario = TextEditingController();
  final servico = TextEditingController();
  final valor = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> createAgendamento(AgendamentoModel agendamentoModel) async {
    await userRepo.creteAgendamento(agendamentoModel);
    // phoneAuthentication(userMode.phoneNo);
    // Get.to(() => const OTPScreen());
  }
}
