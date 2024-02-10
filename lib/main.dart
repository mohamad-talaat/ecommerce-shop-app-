import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      /*     theme:ThemeData.Theme(
      data: ThemeData.light(),
      child: Builder(
        builder: (context) => const HomeScreen(),
      ),
      ), */

      debugShowCheckedModeBanner: false,
      home: SimpleEcommerce(),
    );
  }
}
