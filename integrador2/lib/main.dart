import 'package:flutter/material.dart';
import 'package:integrador1/pantallas/casa_screen.dart';
import 'package:integrador1/pantallas/detalle_juego_screen.dart';
import 'package:integrador1/pantallas/genero_screen.dart';
import 'package:integrador1/pantallas/titulo_juego_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mis libros favoritos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'home',
      routes:{
        'home': (_) => HomeScreen(),
        'genero': (_) => GeneroScreen(),
        'titulo': (_) => TituloScreen(),
        'detalle': (_) => DetalleScreen(),
      }
    );
  }
}