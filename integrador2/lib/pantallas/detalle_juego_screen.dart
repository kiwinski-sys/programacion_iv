import 'package:flutter/material.dart';

class DetalleScreen extends StatelessWidget {
   
const DetalleScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    final Map<String, String> juego = (ModalRoute.of(context)
            ?.settings
            .arguments as Map<String, String>?) ??
        {
          'titulo': 'Juego no seleccionado',
          'genero': 'N/A',
          'imagen': 'https://picsum.photos/seed/default/600/300',
          'descripcion': 'No hay detalles disponibles.',
          'calificacion': '0.0',
          'plataformas': 'N/A',
        };

    return  Scaffold(
      appBar: AppBar(
        title: Text(juego['titulo']!),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del juego
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(juego['imagen']!),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título
                  Text(
                    juego['titulo']!,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Calificación y Género
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${juego['calificacion']} / 5.0',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Chip(
                        label: Text(juego['genero']!),
                        backgroundColor: Colors.blue.shade50,
                      ),
                    ],
                  ),

                  const Divider(height: 30, thickness: 1),

                  // Descripción
                  const Text(
                    'Descripción',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      juego['descripcion']!,
                      style: const TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Plataformas disponibles
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _DetalleItem(
                        icono: Icons.devices,
                        titulo: 'Plataformas',
                        subtitulo: juego['plataformas']!,
                      ),
                      _DetalleItem(
                        icono: Icons.category,
                        titulo: 'Categoría',
                        subtitulo: juego['genero']!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('¡${juego['titulo']} guardado en tus favoritos!'),
            ),
          );
        },
        icon: const Icon(Icons.favorite),
        label: const Text('Favorito'),
      ),
    );
  }
}

class _DetalleItem extends StatelessWidget {
  final IconData icono;
  final String titulo;
  final String subtitulo;

  const _DetalleItem({
    required this.icono,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, color: Colors.blue),
        const SizedBox(height: 4),
        Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
        Text(
          subtitulo,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}