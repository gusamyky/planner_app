import 'package:flutter/material.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/app.dart';
import 'package:planner_app/src/core/services/isar_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await IsarService.initialize();
  await setupInjection();
  await sl.allReady();

  runApp(App());
}
