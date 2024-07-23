
import 'dart:convert';

import 'package:workshop/model/colaborador.dart';

class Workshop {
  final int id;
  final String nome;
  final String? dataRealizacao;
  final String? descricao;
  final List<Colaborador> colaboradores;

  Workshop({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.dataRealizacao,
    required this.colaboradores,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "dataRealizacao": dataRealizacao ?? "",
      "descricao": descricao ?? "",
      "colaboradores": colaboradores.map((Colaborador colaborador) => colaborador.toMap()).toList(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Workshop.fromJson(Map<String, dynamic> map) {
    return Workshop(
      id: map['id'] ?? -1,
      nome: map['nome'] ?? 1,
      dataRealizacao: map['dataRealizacao'] ?? "",
      descricao: map['descricao'] ?? "",
      colaboradores: (map['colaboradores'] as List<dynamic>?)
          ?.map((item) => Colaborador.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}