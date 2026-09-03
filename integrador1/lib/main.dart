import 'package:flutter/material.dart';
import 'package:integrador1/pantallas/casa_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mis libros favoritos 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes:{
        'home': (_) => HomeScreen(),       
      }
    );
  }
}