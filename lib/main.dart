import 'package:flutter/material.dart';
import 'login.dart';
import 'package:magic_sdk/magic_sdk.dart';

void main() {
  runApp(const MyApp());
  Magic.instance = Magic("pk_live_74A909099AF1F275");
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: Stack(
        children: [
          const LoginPage(),
          Magic.instance.relayer,
        ],
      ),
    );
  }
}
