import 'package:flutter/material.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/app.dart';

void main() async {
  await setupInjection();
  await sl.allReady();

  runApp(App());
}

//main page - 2 days near
//today page - today
//month - month
//all - all
//main storage -> cubits for every event list page