
import 'package:dio/dio.dart';
import 'package:workshop/core/constants/api_endpoints.dart';
import 'package:workshop/model/colaborador.dart';

class ColaboradorRepository {
  Dio dio;

  ColaboradorRepository(this.dio);

  Future<List<Colaborador>> getColaboradores() async{
    final response = await dio.get(ApiEndpoints.colaboradoresPath);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final colaboradores = data.map((colaborador) => Colaborador.fromJson(colaborador)).toList();

      return colaboradores;
    }

    throw Exception();
  }

  Future<List<Colaborador>> createColaborador(String name, String? workshopNome) async{
    final headers = {
      "nome": name,
      if(workshopNome != null) "workshop_nome": workshopNome,
    };

    final response = await dio.post(
      ApiEndpoints.colaboradoresPath, 
      options: Options(
        contentType: 'application/json; charset=UTF-8',
        headers: headers,
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;

      final colaboradores = data.map((colaborador) => Colaborador.fromJson(colaborador)).toList();

      return colaboradores;
    }

    throw Exception();
  }
}