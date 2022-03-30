import 'package:flutter/material.dart';

class AppBarNotif extends StatefulWidget {
  const AppBarNotif({Key? key}) : super(key: key);

  @override
  State<AppBarNotif> createState() => _AppBarNotifState();
}

class _AppBarNotifState extends State<AppBarNotif> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Xozircha bo`sh',
          style: TextStyle(
            fontSize: 28,
             fontWeight: FontWeight.bold,
            ),
        ),
      ),
    );
  }
}
