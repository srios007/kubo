import 'package:flutter/material.dart';
import 'src/views/welcome/welcome_view.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Desafío Kubo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
      ),
      home: WelcomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}