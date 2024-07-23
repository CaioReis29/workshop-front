import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:workshop/repositories/ata_repository.dart';
import 'package:workshop/viewmodel/ata_viewmodel.dart';


GetIt inject = GetIt.instance;

Future<void> setupInjection() async {
  await inject.reset();

  final dio = Dio();
  dio.interceptors
    .add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        log("$options", name: "REQUEST OPTIONS");
        log("$handler", name: "REQUEST HANDLER");
        handler.next(options);
      },
      onResponse: (response, handler) {
        log("$response", name: "RESPONSE OPTIONS");
        log("$handler", name: "RESPONSE HANDLER");
        handler.next(response);
      },
      onError: (error, handler) {
        log("$error", name: "ERROR OPTIONS");
        log("$handler", name: "ERROR HANDLER");
        handler.next(error);
      },
    ));

  inject.registerLazySingleton<AtaRepository>(() => AtaRepository(dio));

  inject.registerFactory<AtaViewmodel>(() => AtaViewmodel(inject<AtaRepository>()));
}