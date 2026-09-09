import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:integrador1/provider/juegos_provider.dart';
import 'package:integrador1/pantallas/casa_screen.dart';
import 'package:integrador1/pantallas/detalle_juego_screen.dart';
import 'package:integrador1/pantallas/genero_screen.dart';
import 'package:integrador1/pantallas/titulo_juego_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => JuegosProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mis juegos favoritos',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: 'home',
      routes: {
        'home': (_) => const HomeScreen(),
        'genero': (_) => const GeneroScreen(),
        'titulo': (_) => const TituloScreen(),
        'detalle': (_) => const DetalleScreen(),
      },
    );
  }
}