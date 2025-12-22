import 'package:buyit/app.dart';
import 'package:buyit/noti_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotiService().initNotification();
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: App()));
}
