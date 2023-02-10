import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/core/models/agendamento_model.dart';
import 'package:flutter_ui/src/features/core/models/endereco_model.dart';
import 'package:flutter_ui/src/features/core/models/servico_model.dart';
import 'package:flutter_ui/src/features/core/models/servicos_list_model.dart';
import 'package:flutter_ui/src/features/core/models/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instante => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db
        .collection("Users")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar("Sucesso", "Sua conta foi criada",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, StackTrace) {
      Get.snackbar(
        "Error",
        "Não foi possível criar a conta, tente novamente",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    });
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<ServicoModel> getServicoDetails() async {
    final snapshot = await _db.collection("Splash").get();
    final userData =
        snapshot.docs.map((e) => ServicoModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<List<EnderecoModel>> allEndereco() async {
    final snapshot = await _db.collectionGroup("Endereco").get();
    final userData =
        snapshot.docs.map((e) => EnderecoModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<List<AgendamentoModel>> allAgendamneto() async {
    final snapshot = await _db.collection("Agendamento").get();
    final userData =
        snapshot.docs.map((e) => AgendamentoModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  Future<List<ServicoModel>> allServicod() async {
    final snapshot = await _db.collection("Splash").get();
    final servicoData =
        snapshot.docs.map((e) => ServicoModel.fromSnapshot(e)).toList();
    return servicoData;
  }

  Future<List<ServicoListModel>> allServicosList() async {
    final snapshot = await _db.collection("Servicos").get();
    final servicoData =
        snapshot.docs.map((e) => ServicoListModel.fromSnapshot(e)).toList();
    return servicoData;
  }

  creteAgendamento(AgendamentoModel agendamentoModel) async {
    await _db
        .collection("Agendamento")
        .add(agendamentoModel.toJson())
        .whenComplete(
          () => Get.snackbar("Sucesso", "Agendamento Realizado",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.withOpacity(0.1),
              colorText: Colors.green),
        )
        .catchError((error, StackTrace) {
      Get.snackbar(
        "Error",
        "Não foi possível agendar, tente novamente",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    });
  }
}
