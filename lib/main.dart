import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallet_uz/my_shop/provider/add_favourite.dart';
import 'package:wallet_uz/pages/register.dart';
import 'package:wallet_uz/provider/add_to_history.dart';
import 'package:wallet_uz/provider/register_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(providers: [
        ChangeNotifierProvider<RegisterData>.value(value: RegisterData()),
        ChangeNotifierProvider<AddHistory>.value(value: AddHistory()),
        ChangeNotifierProvider<AddFavorite>.value(value: AddFavorite()),
      ], child: const LoadingScreen()),
    );
  }
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: RegisterData(),
            child: const Register(),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo.png',
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
