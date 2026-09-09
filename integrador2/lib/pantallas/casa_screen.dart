import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:integrador1/provider/juegos_provider.dart';
import 'package:integrador1/widgets/opcion_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _enviarCorreo() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'k.iwinski@eston.ecotec.edu.ec',
      queryParameters: {
        'subject': 'Consulta / Comentario sobre la App de Videojuegos',
      },
    );

    if (!await launchUrl(emailUri)) {
      debugPrint('No se pudo abrir la app de correo');
    }
  }

  void _mostrarMensajeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.mark_email_read, color: Colors.deepPurple),
              SizedBox(width: 10),
              Text('Mensaje'),
            ],
          ),
          content: const Text(
            'Escríbeme, tus comentarios son importantes, te responderé en cuanto me sea posible',
            style: TextStyle(fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis juegos de video'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatarki.png'),
            ),
            const SizedBox(height: 12),
            const Text(
              'Krystian Iwinski',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '¡Bienvenido al Mundo Gamer!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Explora el fascinante universo de los videojuegos, desde los géneros más populares hasta tus títulos favoritos.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    // Demostración del estado actualizado con Consumer
                    Consumer<JuegosProvider>(
                      builder: (context, provider, child) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'Juegos favoritos: ${provider.favoritos.length}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 24, thickness: 1),
            Expanded(
              child: ListView(
                children: [
                  OpcionMenuWidget(
                    icono: Icons.category,
                    titulo: 'Géneros',
                    subtitulo: 'Estrategia, Acción, Rol, Deportes',
                    onTap: () => Navigator.pushNamed(context, 'genero'),
                  ),
                  OpcionMenuWidget(
                    icono: Icons.videogame_asset,
                    titulo: 'Catálogo General',
                    subtitulo: 'Ver todos los videojuegos disponibles',
                    onTap: () => Navigator.pushNamed(context, 'titulo', arguments: 'Todos'),
                  ),
                  OpcionMenuWidget(
                    icono: Icons.favorite,
                    titulo: 'Mis Favoritos',
                    subtitulo: 'Juegos marcados con me gusta',
                    onTap: () => Navigator.pushNamed(context, 'titulo', arguments: 'Favoritos'),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.email, size: 28, color: Colors.deepPurple),
                          tooltip: 'Enviar Correo',
                          onPressed: _enviarCorreo,
                        ),
                        const SizedBox(width: 20),
                        IconButton(
                          icon: const Icon(Icons.info, size: 28, color: Colors.amber),
                          tooltip: 'Información de contacto',
                          onPressed: () => _mostrarMensajeDialog(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}