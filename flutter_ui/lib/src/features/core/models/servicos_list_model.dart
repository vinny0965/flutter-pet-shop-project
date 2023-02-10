import 'package:cloud_firestore/cloud_firestore.dart';

class ServicoListModel {
  final String? id;
  final String msg;
  final String tipo;
  final String valor;

  const ServicoListModel(
      {this.id, required this.msg, required this.tipo, required this.valor});

  toJson() {
    return {"Msg": msg, "Tipo": tipo, "Valor": valor};
  }

  factory ServicoListModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return ServicoListModel(
        id: document.id,
        msg: data["Msg"],
        tipo: data["Tipo"],
        valor: data["Valor"]);
  }
}
