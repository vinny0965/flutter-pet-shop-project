import 'package:cloud_firestore/cloud_firestore.dart';

class AgendamentoModel {
  final String? id;
  final String data;
  final String horario;
  final String servico;
  final String valor;

  const AgendamentoModel(
      {this.id,
      required this.data,
      required this.horario,
      required this.servico,
      required this.valor});

  toJson() {
    return {
      "Data": data,
      "Horario": horario,
      "Servico": servico,
      "Valor": valor
    };
  }

  factory AgendamentoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return AgendamentoModel(
        id: document.id,
        data: data["Data"],
        horario: data["Horario"],
        servico: data["Servico"],
        valor: data["Valor"]);
  }
}
