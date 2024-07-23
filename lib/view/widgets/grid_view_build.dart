import 'package:flutter/material.dart';
import 'package:workshop/core/extensions/date_time_extension.dart';
import 'package:workshop/model/ata.dart';
import 'package:workshop/view/widgets/workshop_details.dart';

class GridViewBuild extends StatelessWidget {

  final List<Ata> atas;
  final double width;

  const GridViewBuild({ super.key, required this.atas, required this.width });

   @override
   Widget build(BuildContext context) {
    int crossAxisCount;
    double childAspectRatio;

    if (width > 1000) {
      crossAxisCount = 3;
      childAspectRatio = 1.5; 
    } else if (width > 600) {
      crossAxisCount = 2;
      childAspectRatio = 1.5; 
    } else {
      crossAxisCount = 1;
      childAspectRatio = 2.0; 
    }
       return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: childAspectRatio,
      ),
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
                  Text('Workshop: ${ata.workshop.nome}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 6.0),
                  Text('Data de realização do evento: ${DateTime.parse(ata.workshop.dataRealizacao!).brazilianDateTime}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                  const SizedBox(height: 6.0),
                  Text('Descrição: ${ata.workshop.descricao}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                  const SizedBox(height: 6.0),
                  Text('Colaborador: ${ata.colaboradores.isNotEmpty ? ata.colaboradores.map((colaborador) => colaborador.nome).join(', ') : 'Nenhum colaborador'}', style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}