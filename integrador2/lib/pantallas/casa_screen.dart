import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Función para abrir la aplicación de correo
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

  // Función para mostrar el AlertDialog informativo
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
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
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
            // Avatar de usuario
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatarki.png'),
              /* backgroundColor: Colors.deepPurpleAccent,
              child: Icon(
                Icons.sports_esports,
                size: 50,
                color: Colors.white,
              ), */
            ),
            const SizedBox(height: 12),

            // Nombre
            const Text(
              'Krystian Iwinski',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Tarjeta introductoria
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '¡Bienvenido al Mundo Gamer!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Explora el fascinante universo de los videojuegos, desde los géneros más populares hasta los títulos más aclamados y sus detalles principales.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            const Divider(height: 24, thickness: 1),

            // Opciones de navegación
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.category, color: Colors.deepPurple),
                      title: const Text('Género'),
                      subtitle: const Text('Estrategia, Acción, Rol, Deportes'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.pushNamed(context, 'genero'),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.videogame_asset, color: Colors.deepPurple),
                      title: const Text('Título'),
                      subtitle: const Text('Catálogo de videojuegos'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.pushNamed(context, 'genero'),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.info_outline, color: Colors.deepPurple),
                      title: const Text('Detalle'),
                      subtitle: const Text('Información general del juego'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.pushNamed(context, 'genero'),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Sección final con los botones de Correo e Información (AlertDialog)
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
                        // Ícono para enviar correo
                        IconButton(
                          icon: const Icon(Icons.email, size: 28, color: Colors.deepPurple),
                          tooltip: 'Enviar Correo',
                          onPressed: _enviarCorreo,
                        ),
                        const SizedBox(width: 20),
                        // Ícono que activa el AlertDialog
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Añadir Juego',
        child: const Icon(Icons.add),
      ),
    );
  }
}