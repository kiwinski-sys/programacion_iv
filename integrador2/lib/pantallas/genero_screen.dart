import 'package:flutter/material.dart';

class GeneroScreen extends StatelessWidget {
   
const GeneroScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> generos = [
      {
        'nombre': 'Estrategia',
        'descripcion': 'Juegos centrados en la planificación y toma de decisiones tácticas.',
        'icono': Icons.psychology,
        'color': Colors.amber,
      },
      {
        'nombre': 'Acción',
        'descripcion': 'Juegos dinámicos centrados en combates y reflejos.',
        'icono': Icons.flash_on,
        'color': Colors.red,
      },
      {
        'nombre': 'Rol',
        'descripcion': 'Asume el papel de un personaje y vive historias profundas.',
        'icono': Icons.shield,
        'color': Colors.purple,
      },
      {
        'nombre': 'Deportes',
        'descripcion': 'Simulaciones de disciplinas deportivas e intensas competencias.',
        'icono': Icons.sports_soccer,
        'color': Colors.green,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona un Género'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: generos.length,
        itemBuilder: (context, index) {
          final genero = generos[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.all(12.0),
              leading: CircleAvatar(
                backgroundColor: genero['color'],
                child: Icon(genero['icono'], color: Colors.white),
              ),
              title: Text(
                genero['nombre'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(genero['descripcion']),
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Pasamos la categoría seleccionada como argumento
                Navigator.pushNamed(
                  context,
                  'titulo',
                  arguments: genero['nombre'],
                );
              },
            ),
          );
        },
      ),
    );
  }
}