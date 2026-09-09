import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:integrador1/modelos/juego_modelo.dart';
import 'package:integrador1/provider/juegos_provider.dart';
import 'package:integrador1/widgets/tarjeta_juego_widget.dart';

class TituloScreen extends StatelessWidget {
  const TituloScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String filtroSeleccionado =
        (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Todos';

    return Scaffold(
      appBar: AppBar(
        title: Text(filtroSeleccionado == 'Todos'
            ? 'Catálogo Completo'
            : filtroSeleccionado == 'Favoritos'
                ? 'Mis Favoritos'
                : 'Juegos de $filtroSeleccionado'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Consumer<JuegosProvider>(
        builder: (context, provider, child) {
          List<Juego> juegos = [];

          if (filtroSeleccionado == 'Todos') {
            juegos = provider.juegos;
          } else if (filtroSeleccionado == 'Favoritos') {
            juegos = provider.favoritos;
          } else {
            juegos = provider.getJuegosPorGenero(filtroSeleccionado);
          }

          if (juegos.isEmpty) {
            return const Center(
              child: Text(
                'No hay juegos disponibles en esta sección.',
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.72,
              ),
              itemCount: juegos.length,
              itemBuilder: (context, index) {
                return TarjetaJuegoWidget(juego: juegos[index]);
              },
            ),
          );
        },
      ),
    );
  }
}