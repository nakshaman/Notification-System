import 'package:buyit/noti_service.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class App extends StatefulWidget {
  final Function onToggleTheme;
  const App({super.key, required this.onToggleTheme});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int diceNumber = 1;
  final random = Random();
  void changeDice() {
    setState(() {
      diceNumber = random.nextInt(6) + 1;
    });
  }

  ThemeData currentTheme = ThemeData.light();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Roller',
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[500],
                  ),
                  child: IconButton(
                    onPressed: () {
                      widget.onToggleTheme();
                    },
                    icon: Theme.of(context).brightness == Brightness.dark
                        ? whiteThemeIcon()
                        : blackThemeIcon(),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[500],
                  ),
                  child: IconButton(
                    onPressed: () {
                      NotiService().showNotification(
                        title: 'Dice rolled',
                        body: 'Dice is rolled finally',
                      );
                    },
                    icon: Icon(
                      Icons.notification_add_rounded,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(
              thickness: 0.8,
              color: Colors.grey,
              radius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'images/dice$diceNumber.png',
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    height: 200,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      changeDice();
                    },
                    child: Text(
                      'Change Dice',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget whiteThemeIcon() {
  return Icon(Icons.light_mode, color: Colors.white);
}

Widget blackThemeIcon() {
  return Icon(Icons.dark_mode, color: Colors.black);
}
