import 'package:flutter/material.dart';
import 'package:workshop/core/app/my_app.dart';
import 'package:workshop/core/setup_injects.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await setupInjection();

  runApp(const MyApp());
}
