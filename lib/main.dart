import 'package:flutter/material.dart';
import 'package:planner_app/injector.dart';
import 'package:planner_app/src/app.dart';
import 'package:planner_app/src/core/services/isar_service.dart';
import 'package:planner_app/src/core/services/local_notification_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService().init();
  tz.initializeTimeZones();
  await IsarService.initialize();
  await Firebase.initializeApp();
  await setupInjection();
  await sl.allReady();
  runApp(App());
}
