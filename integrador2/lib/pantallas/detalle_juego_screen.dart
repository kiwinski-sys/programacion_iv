import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:integrador1/modelos/juego_modelo.dart';
import 'package:integrador1/provider/juegos_provider.dart';

class DetalleScreen extends StatelessWidget {
  const DetalleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Juego? juego = ModalRoute.of(context)?.settings.arguments as Juego?;

    if (juego == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('Juego no seleccionado')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(juego.titulo),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(juego.imagen),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    juego.titulo,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${juego.calificacion} / 5.0',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Chip(
                        label: Text(juego.genero),
                        backgroundColor: Colors.blue.shade50,
                      ),
                    ],
                  ),
                  const Divider(height: 30, thickness: 1),
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
                      juego.descripcion,
                      style: const TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _DetalleItem(
                        icono: Icons.devices,
                        titulo: 'Plataformas',
                        subtitulo: juego.plataformas,
                      ),
                      _DetalleItem(
                        icono: Icons.category,
                        titulo: 'Categoría',
                        subtitulo: juego.genero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Consumer<JuegosProvider>(
        builder: (context, provider, child) {
          final esFav = juego.esFavorito;
          return FloatingActionButton.extended(
            onPressed: () {
              provider.toggleFavorito(juego);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text(
                    !esFav
                        ? '¡${juego.titulo} añadido a favoritos!'
                        : '${juego.titulo} eliminado de favoritos',
                  ),
                ),
              );
            },
            icon: Icon(esFav ? Icons.favorite : Icons.favorite_border),
            label: Text(esFav ? 'En Favoritos' : 'Añadir a Favoritos'),
            backgroundColor: esFav ? Colors.red : Colors.deepPurple,
            foregroundColor: Colors.white,
          );
        },
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