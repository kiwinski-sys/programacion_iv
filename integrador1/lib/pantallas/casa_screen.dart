import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   
const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Mis libros favoritos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          // 7. Column (disposición vertical)
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 7. Card (contenedor con sombra)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  // 7. Column interna de la tarjeta
                  child: Column(
                    children: [
                      // 6. Ícono o Imagen
                      const Icon(
                        Icons.menu_book_rounded,
                        size: 80,
                        color: Colors.amber,
                      ),
                      const SizedBox(height: 15),

                      // 5. Textos informativos
                      const Text(
                        'Cien años de soledad',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Gabriel García Márquez',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 15),

                      // 7. Container para reseña o descripción
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.amber.shade50,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Una obra maestra del realismo mágico que narra la historia de la familia Buendía en el pueblo ficticio de Macondo.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      const SizedBox(height: 15),

                      // 7. Row (disposición horizontal de datos)
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 4),
                              Text('4.8 / 5.0'),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.auto_stories, color: Colors.amber, size: 20),
                              SizedBox(width: 4),
                              Text('496 pág.'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 8. Botón
              ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Libro agregado a tu lista de lectura'),
                    ),
                  );
                },
                icon: const Icon(Icons.bookmark_add),
                label: const Text('Guardar en Favoritos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}