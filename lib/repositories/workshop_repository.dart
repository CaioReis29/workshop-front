
import 'package:dio/dio.dart';
import 'package:workshop/core/constants/api_endpoints.dart';
import 'package:workshop/model/workshop.dart';

class WorkshopRepository {
  Dio dio;

  WorkshopRepository(this.dio);

  Future<List<Workshop>> getWorkshops() async{
    final response = await dio.get(ApiEndpoints.workshopsPath);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final workshops = data.map((workshop) => Workshop.fromJson(workshop)).toList();

      return workshops;
    }

    throw Exception();
  }

  Future<Workshop> getWorkshopById(int id) async{
    final response = await dio.get("${ApiEndpoints.workshopsPath}/id");

    if (response.statusCode == 200) {
      final data = response.data;

      final workshop = Workshop.fromJson(data);

      return workshop;
    }

    throw Exception();
  }

  Future<List<Workshop>> createColaborador(String nome, String dataRealizacao, String descricao) async{
    final headers = {
      "nome": nome,
      "dataRealizacao": dataRealizacao,
      "descricao": descricao,
    };

    final response = await dio.post(
      ApiEndpoints.workshopsPath, 
      options: Options(
        contentType: 'application/json; charset=UTF-8',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final colaboradores = data.map((colaborador) => Workshop.fromJson(colaborador)).toList();

      return colaboradores;
    }

    throw Exception();
  }
}