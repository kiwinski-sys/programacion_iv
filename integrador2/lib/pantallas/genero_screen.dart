import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:integrador1/provider/juegos_provider.dart';
import 'package:integrador1/widgets/opcion_menu_widget.dart';

class GeneroScreen extends StatelessWidget {
  const GeneroScreen({super.key});

  // Mapeo de íconos según el género para una mejor presentación visual
  IconData _obtenerIconoGenero(String genero) {
    switch (genero.toLowerCase()) {
      case 'estrategia':
        return Icons.psychology;
      case 'acción':
      case 'accion':
        return Icons.flash_on;
      case 'rol':
        return Icons.auto_awesome;
      case 'deportes':
        return Icons.sports_esports;
      default:
        return Icons.sports_esports;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías de Juegos'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<JuegosProvider>(
        builder: (context, provider, child) {
          // Obtenemos la lista de géneros sin duplicados directamente desde el Provider
          final generos = provider.juegos
              .map((juego) => juego.genero)
              .toSet()
              .toList();

          if (generos.isEmpty) {
            return const Center(
              child: Text('No hay géneros disponibles'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: generos.length,
            itemBuilder: (context, index) {
              final genero = generos[index];
              final cantidadJuegos = provider.getJuegosPorGenero(genero).length;

              return OpcionMenuWidget(
                icono: _obtenerIconoGenero(genero),
                titulo: genero,
                subtitulo: '$cantidadJuegos juego${cantidadJuegos == 1 ? '' : 's'} disponible${cantidadJuegos == 1 ? '' : 's'}',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    'titulo',
                    arguments: genero,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}