import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:integrador1/modelos/juego_modelo.dart';
import 'package:integrador1/provider/juegos_provider.dart';

class TarjetaJuegoWidget extends StatelessWidget {
  final Juego juego;

  const TarjetaJuegoWidget({super.key, required this.juego});

  @override
  Widget build(BuildContext context) {
    final juegosProvider = Provider.of<JuegosProvider>(context, listen: false);

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.asset(
                      juego.imagen,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.videogame_asset, size: 50),
                    ),
                  ),
                ),
                // Botón de acceso rápido a Favorito
                Positioned(
                  top: 4,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: Colors.black45,
                    child: IconButton(
                      icon: Icon(
                        juego.esFavorito ? Icons.favorite : Icons.favorite_border,
                        color: juego.esFavorito ? Colors.red : Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        juegosProvider.toggleFavorito(juego);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  juego.titulo,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      'detalle',
                      arguments: juego,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: const Text(
                    'Ver Detalle',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}