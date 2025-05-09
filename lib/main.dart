import 'package:flutter/material.dart';
import 'package:examen_android/home_screen.dart'; // Pantalla 1

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(), // Carga la primera pantalla
    );
  }
}
