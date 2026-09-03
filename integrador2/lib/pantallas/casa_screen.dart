import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Juegos de Video'),
        centerTitle: true,
        actions: [
          // Widget 1: IconButton
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      // Widget 2: Padding
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            const CircleAvatar(
              radius: 50,              
              backgroundImage: AssetImage('assets/avatarki.png'),
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

            
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: const [
                    Text(
                      '¡Bienvenido al Mundo Gamer!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurpleAccent,
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

            
            const Divider(height: 32, thickness: 1),

            
            Expanded(
              child: ListView(
                children: [
                  
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10,
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    
                    child: ListTile(
                      leading: const Icon(Icons.category, color: Colors.purpleAccent),
                      title: const Text('Género'),
                      subtitle: const Text('Acción, RPG, Aventura, Estrategia...'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.pushNamed(context, 'genero'), 
                        
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10,
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    // ListTile (Título)
                    child: ListTile(
                      leading: const Icon(Icons.videogame_asset, color: Colors.blueAccent),
                      title: const Text('Título del juego'),
                      subtitle: const Text('Catálogo de juegos populares'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.pushNamed(context, 'titulo'),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white10,
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    // ListTile (Detalle)
                    child: ListTile(
                      leading: const Icon(Icons.info_outline, color: Colors.greenAccent),
                      title: const Text('Detalles del juego'),
                      subtitle: const Text('Información técnica y reseñas'),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () => Navigator.pushNamed(context, 'detalle'),
                    ),
                  ),

                  const SizedBox(height: 10),

                  
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.explore),
                    label: const Text('Explorar Todo el Catálogo'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Widget 12: FloatingActionButton
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Añadir Juego',
        child: const Icon(Icons.add),
      ),
    );
  }
}