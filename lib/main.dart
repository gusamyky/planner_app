import 'package:flutter/material.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/app.dart';

void main() async {
  await setupInjection();
  await sl.allReady();

  runApp(App());
}
