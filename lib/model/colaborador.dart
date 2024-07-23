
import 'dart:convert';

class Colaborador {
  final int id;
  final String nome;

  Colaborador({
    required this.id,
    required this.nome,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Colaborador.fromJson(Map<String, dynamic> map) {
    return Colaborador(
      id: map['id'] ?? -1,
      nome: map['nome'] ?? 1,
    );
  }
}