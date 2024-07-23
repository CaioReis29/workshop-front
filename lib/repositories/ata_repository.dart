
import 'package:dio/dio.dart';
import 'package:workshop/core/constants/api_endpoints.dart';
import 'package:workshop/model/ata.dart';

class AtaRepository {
  Dio dio;

  AtaRepository(this.dio);

  Future<List<Ata>> getAtas() async{
    final response = await dio.get(ApiEndpoints.atasPath);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final atas = data.map((ata) => Ata.fromJson(ata)).toList();

      return atas;
    }

    throw Exception();
  }
}