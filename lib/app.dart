import 'package:buyit/noti_service.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[700],
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey[500], // button color
            foregroundColor: Colors.grey[300], // text color
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
          ),
          onPressed: () {
            NotiService().showNotification(
              title: 'Hello Naksh',
              body: 'Someone Messaged You nakshie! ',
            );
          },
          child: const Text('Send Notification'),
        ),
      ),
    );
  }
}
