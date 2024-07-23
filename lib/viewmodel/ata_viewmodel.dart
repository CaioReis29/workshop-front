import 'package:workshop/model/ata.dart';
import 'package:workshop/repositories/ata_repository.dart';
import 'package:signals/signals_flutter.dart';

class AtaViewmodel {
  final AtaRepository _repository;

  AtaViewmodel(this._repository);

  late final atas = signal<AsyncState<List<Ata>>>(const AsyncData([]));

  final colaboradorController = signal('');
  final workshopController = signal('');
  final dataController = signal('');

  void getAtas() async {
    atas.value = const AsyncLoading();
    try {
      final response = await _repository.getAtas();
      atas.value = AsyncData(response);
    } catch (error, stackTrace) {
      atas.value = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}