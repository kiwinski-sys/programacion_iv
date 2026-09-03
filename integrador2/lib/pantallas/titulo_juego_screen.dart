/* import 'package:flutter/material.dart';

class TituloScreen extends StatelessWidget {
   
const TituloScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: Text('Titulo del Juego'),
      ),
    );
  }
} */
import 'package:flutter/material.dart';

class TituloScreen extends StatelessWidget {
  const TituloScreen({super.key});

  static final Map<String, List<Map<String, String>>> baseDeDatosJuegos = {
    'Estrategia': [
      {
        'titulo': 'Starcraft 2',
        'genero': 'Estrategia',
        'imagen': 'assets/titulos/starcraft2.jpeg',
        'descripcion': 'El referente de la estrategia en tiempo real donde tres razas únicas (Terran, Zerg y Protoss) luchan por el dominio galáctico.',
        'calificacion': '4.9',
        'plataformas': 'PC',
      },
      {
        'titulo': 'Age of Empires 4',
        'genero': 'Estrategia',
        'imagen': 'assets/titulos/ageofempire.jpeg',
        'descripcion': 'Revive las grandes batallas históricas construyendo imperios, gestionando recursos y liderando ejércitos a través de la historia.',
        'calificacion': '4.7',
        'plataformas': 'PC, Xbox',
      },
    ],
    'Acción': [
      {
        'titulo': 'Pragmata',
        'genero': 'Acción',
        'imagen': 'assets/titulos/pragmata.jpeg',
        'descripcion': 'Una misteriosa aventura de acción ambientada en un mundo distópico en la Luna, con mecánicas de combate y exploración de ciencia ficción.',
        'calificacion': '4.5',
        'plataformas': 'PS5, Xbox, PC',
      },
      {
        'titulo': 'Diablo 4',
        'genero': 'Acción',
        'imagen': 'assets/titulos/diablo4.jpeg',
        'descripcion': 'Enfréntate a las huestes del Infierno en un mundo abierto oscuro repleto de hordas de demonios, mazmorras e incontables tesoros.',
        'calificacion': '4.6',
        'plataformas': 'PS5, Xbox, PC',
      },
    ],
    'Rol': [
      {
        'titulo': 'Mass Effect',
        'genero': 'Rol',
        'imagen': 'assets/titulos/masseffect.jpeg',
        'descripcion': 'Una ópera espacial donde tus decisiones moldean el destino de la galaxia a través de la piel del Comandante Shepard.',
        'calificacion': '4.8',
        'plataformas': 'PS4, Xbox, PC',
      },
      {
        'titulo': 'Witcher 3',
        'genero': 'Rol',
        'imagen': 'assets/titulos/witcher.jpeg',
        'descripcion': 'Acompaña a Geralt de Rivia, un cazador de monstruos a sueldo, en la búsqueda de la niña de la profecía en un vasto mundo abierto.',
        'calificacion': '5.0',
        'plataformas': 'PS5, Xbox, Switch, PC',
      },
    ],
    'Deportes': [
      {
        'titulo': 'Forza Horizon 4',
        'genero': 'Deportes',
        'imagen': 'assets/titulos/forza.jpeg',
        'descripcion': 'Disfruta de carreras automovilísticas en un festival abierto ambientado en Gran Bretaña con estaciones del año cambiantes dinámicamente.',
        'calificacion': '4.8',
        'plataformas': 'Xbox, PC',
      },
      {
        'titulo': 'Street Fighter 5',
        'genero': 'Deportes',
        'imagen': 'assets/titulos/streetfighter.jpeg',
        'descripcion': 'Competencia de lucha de clase mundial con luchadores legendarios, combos dinámicos y combate multijugador competitivo.',
        'calificacion': '4.4',
        'plataformas': 'PS4, PC',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    // Lista de juegos de muestra con imágenes directas
   final String generoSeleccionado =
        (ModalRoute.of(context)?.settings.arguments as String?) ?? 'Estrategia';

    // Obtenemos únicamente los juegos del género seleccionado
    final List<Map<String, String>> juegos =
        baseDeDatosJuegos[generoSeleccionado] ?? [];
    return Scaffold(
      appBar: AppBar(
        title: Text('Juegos de $generoSeleccionado'),
      ),
      body: Padding(
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
            final juego = juegos[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.asset(
                        juego['imagen']!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.videogame_asset, size: 50),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          juego['titulo']!,
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
                            // Pasamos la información completa del juego al detalle
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
          },
        ),
      ),
    );
  }
}