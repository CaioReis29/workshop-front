import 'package:flutter/material.dart';
import 'package:signals/signals_flutter.dart';
import 'package:workshop/core/setup_injects.dart';
import 'package:workshop/view/widgets/grid_view_build.dart';
import 'package:workshop/view/widgets/list_view_buil.dart';
import 'package:workshop/viewmodel/ata_viewmodel.dart';

final viewModel = inject<AtaViewmodel>();

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final colaboradorController = TextEditingController();
  final workshopController = TextEditingController();
  final dataController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel.getAtas();
    colaboradorController.addListener(_filterAtas);
    workshopController.addListener(_filterAtas);
    dataController.addListener(_filterAtas);
  }

  void _filterAtas() {
    setState(() {});
  }

  @override
  void dispose() {
    colaboradorController.dispose();
    workshopController.dispose();
    dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final atas = viewModel.atas.watch(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atas dos Workshops'),
        titleTextStyle: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        backgroundColor: Colors.blue,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextField(
                          controller: colaboradorController,
                          decoration: InputDecoration(
                            labelText: 'Colaborador',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: TextField(
                          controller: workshopController,
                          decoration: InputDecoration(
                            labelText: 'Workshop',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              borderSide: const BorderSide(color: Colors.blue),
                            ),
                            prefixIcon: const Icon(Icons.event),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: dataController,
                        decoration: InputDecoration(
                          labelText: 'Data Workshop',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                          prefixIcon: const Icon(Icons.calendar_today),
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: atas.maybeMap(
                    loading: () => const Center(child: CircularProgressIndicator()),
                    error: (e, s) => Center(child: Text(e.toString())),
                    data: (atas) {
                      final filteredAtas = atas.where((ata) {
                        final colaboradorMatch = colaboradorController.text.isEmpty ||
                          ata.colaboradores.any((colaborador) => colaborador.nome.toLowerCase().contains(colaboradorController.text.toLowerCase()));
                        final workshopMatch = workshopController.text.isEmpty ||
                          ata.workshop.nome.toLowerCase().contains(workshopController.text.toLowerCase());
                        final dataMatch = dataController.text.isEmpty ||
                          ata.workshop.dataRealizacao?.contains(dataController.text) == true;
                        return colaboradorMatch && workshopMatch && dataMatch;
                      }).toList();

                      return constraints.maxWidth < 600
                        ? ListViewBuil(atas: filteredAtas)
                        : GridViewBuild(atas: filteredAtas, width: constraints.maxWidth);
                    },
                    orElse: () => Container(),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}