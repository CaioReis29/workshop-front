
import 'dart:convert';

import 'package:workshop/model/colaborador.dart';
import 'package:workshop/model/workshop.dart';

class Ata {
  final int id;
  final Workshop workshop;
  final List<Colaborador> colaboradores;

  Ata({
    required this.id,
    required this.workshop,
    required this.colaboradores,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "workshop": workshop,
      "colaboradores": colaboradores,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory Ata.fromJson(Map<String, dynamic> map) {
    return Ata(
      id: map['id'] ?? -1,
      workshop: Workshop.fromJson(map['workshop']),
      colaboradores: (map['colaboradores'] as List<dynamic>?)
          ?.map((item) => Colaborador.fromJson(item as Map<String, dynamic>))
          .toList() ?? [],
    );
  }
}