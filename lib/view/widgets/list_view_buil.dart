import 'package:flutter/material.dart';
import 'package:workshop/core/extensions/date_time_extension.dart';
import 'package:workshop/model/ata.dart';
import 'package:workshop/view/widgets/workshop_details.dart';

class ListViewBuil extends StatelessWidget {

  final List<Ata> atas;

  const ListViewBuil({ super.key, required this.atas });

   @override
   Widget build(BuildContext context) {
       return ListView.builder(
      itemCount: atas.length,
      itemBuilder: (context, index) {
        final ata = atas[index];
        return GestureDetector(
          onTap: () => showWorkshopDetails(context, ata),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Workshop: ${ata.workshop.nome}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 8.0),
                  Text('Data de realização do evento: ${DateTime.parse(ata.workshop.dataRealizacao!).brazilianDateTime}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  const SizedBox(height: 8.0),
                  Text('Descrição: ${ata.workshop.descricao}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                  const SizedBox(height: 8.0),
                  Text('Colaborador: ${ata.colaboradores.isNotEmpty ? ata.colaboradores.map((colaborador) => colaborador.nome).join(', ') : 'Nenhum colaborador'}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}