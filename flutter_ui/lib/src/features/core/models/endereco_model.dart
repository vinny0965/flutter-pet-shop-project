import 'package:cloud_firestore/cloud_firestore.dart';

class EnderecoModel {
  final String? id;
  final String cidade;

  const EnderecoModel({
    this.id,
    required this.cidade,
  });

  toJson() {
    return {
      "Cidade": cidade,
    };
  }

  factory EnderecoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return EnderecoModel(
      id: document.id,
      cidade: data["Cidade"],
    );
  }
}
