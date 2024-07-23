import 'package:flutter/material.dart';
import 'package:workshop/core/extensions/date_time_extension.dart';
import 'package:workshop/model/ata.dart';

void showWorkshopDetails(BuildContext context, Ata ata) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 16,
        child: FractionallySizedBox(
          widthFactor: 0.9, 
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Workshop: ${ata.workshop.nome}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                const SizedBox(height: 12.0),
                Text('Data de realização do evento: ${DateTime.parse(ata.workshop.dataRealizacao!).brazilianDateTime}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                const SizedBox(height: 12.0),
                Text('Descrição: ${ata.workshop.descricao}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                const SizedBox(height: 12.0),
                Text('Colaborador: ${ata.colaboradores.isNotEmpty ? ata.colaboradores.map((colaborador) => colaborador.nome).join(', ') : 'Nenhum colaborador'}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                const SizedBox(height: 20.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text('Fechar', style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}