import 'package:flutter/material.dart';
import 'package:flutter_ui/src/features/core/models/endereco_model.dart';
import 'package:flutter_ui/src/features/core/models/servico_model.dart';
import 'package:flutter_ui/src/features/core/models/servicos_list_model.dart';
import 'package:flutter_ui/src/features/core/models/user_model.dart';
import 'package:flutter_ui/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_ui/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  getServicoData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getServicoDetails();
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<EnderecoModel>> getEnderecoData() async {
    return await _userRepo.allEndereco();
  }

  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }

  Future<List<ServicoModel>> getServicoData2() async {
    return await _userRepo.allServicod();
  }

  Future<List<ServicoListModel>> getServicoList() async {
    return await _userRepo.allServicosList();
  }
}
