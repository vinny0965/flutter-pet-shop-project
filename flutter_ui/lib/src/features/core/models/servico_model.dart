import 'package:cloud_firestore/cloud_firestore.dart';

class ServicoModel {
  final String? id;
  final String servico;
  final String tipo;

  const ServicoModel({this.id, required this.servico, required this.tipo});

  toJson() {
    return {"Servico": servico, "Tipo": tipo};
  }

  factory ServicoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ServicoModel(
        id: document.id, servico: data["Servico"], tipo: data["Tipo"]);
  }
}
