import 'package:buyit/app.dart';
import 'package:buyit/noti_service.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotiService().initNotification();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  void toggleTheme() {
    setState(() {
      themeMode == ThemeMode.light
          ? themeMode = ThemeMode.dark
          : themeMode = ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      home: AnimatedTheme(
        data: themeMode == ThemeMode.light
            ? ThemeData.light()
            : ThemeData.dark(),
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        child: App(onToggleTheme: toggleTheme),
      ),
    );
  }
}
