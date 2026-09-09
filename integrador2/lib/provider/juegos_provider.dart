import 'package:flutter/material.dart';
import 'package:integrador1/modelos/juego_modelo.dart';

class JuegosProvider extends ChangeNotifier {
  final List<Juego> _juegos = [
    // Estrategia
    Juego(
      id: '1',
      titulo: 'Starcraft 2',
      genero: 'Estrategia',
      imagen: 'assets/titulos/starcraft2.jpeg',
      descripcion: 'El referente de la estrategia en tiempo real donde tres razas únicas (Terran, Zerg y Protoss) luchan por el dominio galáctico.',
      calificacion: 4.9,
      plataformas: 'PC',
    ),
    Juego(
      id: '2',
      titulo: 'Age of Empires 4',
      genero: 'Estrategia',
      imagen: 'assets/titulos/ageofempire.jpeg',
      descripcion: 'Revive las grandes batallas históricas construyendo imperios, gestionando recursos y liderando ejércitos a través de la historia.',
      calificacion: 4.7,
      plataformas: 'PC, Xbox',
    ),
    // Acción
    Juego(
      id: '3',
      titulo: 'Pragmata',
      genero: 'Acción',
      imagen: 'assets/titulos/pragmata.jpeg',
      descripcion: 'Una misteriosa aventura de acción ambientada en un mundo distópico en la Luna, con mecánicas de combate y exploración de ciencia ficción.',
      calificacion: 4.5,
      plataformas: 'PS5, Xbox, PC',
    ),
    Juego(
      id: '4',
      titulo: 'Diablo 4',
      genero: 'Acción',
      imagen: 'assets/titulos/diablo4.jpeg',
      descripcion: 'Enfréntate a las huestes del Infierno en un mundo abierto oscuro repleto de hordas de demonios, mazmorras e incontables tesoros.',
      calificacion: 4.6,
      plataformas: 'PS5, Xbox, PC',
    ),
    // Rol
    Juego(
      id: '5',
      titulo: 'Mass Effect',
      genero: 'Rol',
      imagen: 'assets/titulos/masseffect.jpeg',
      descripcion: 'Una ópera espacial donde tus decisiones moldean el destino de la galaxia a través de la piel del Comandante Shepard.',
      calificacion: 4.8,
      plataformas: 'PS4, Xbox, PC',
    ),
    Juego(
      id: '6',
      titulo: 'Witcher 3',
      genero: 'Rol',
      imagen: 'assets/titulos/witcher.jpeg',
      descripcion: 'Acompaña a Geralt de Rivia, un cazador de monstruos a sueldo, en la búsqueda de la niña de la profecía en un vasto mundo abierto.',
      calificacion: 5.0,
      plataformas: 'PS5, Xbox, Switch, PC',
    ),
    // Deportes
    Juego(
      id: '7',
      titulo: 'Forza Horizon 4',
      genero: 'Deportes',
      imagen: 'assets/titulos/forza.jpeg',
      descripcion: 'Disfruta de carreras automovilísticas en un festival abierto ambientado en Gran Bretaña con estaciones del año cambiantes dinámicamente.',
      calificacion: 4.8,
      plataformas: 'Xbox, PC',
    ),
    Juego(
      id: '8',
      titulo: 'Street Fighter 5',
      genero: 'Deportes',
      imagen: 'assets/titulos/streetfighter.jpeg',
      descripcion: 'Competencia de lucha de clase mundial con luchadores legendarios, combos dinámicos y combate multijugador competitivo.',
      calificacion: 4.4,
      plataformas: 'PS4, PC',
    ),
  ];

  List<Juego> get juegos => _juegos;

  // Obtener juegos por género
  List<Juego> getJuegosPorGenero(String genero) {
    return _juegos.where((j) => j.genero == genero).toList();
  }

  // Obtener solo los juegos favoritos
  List<Juego> get favoritos => _juegos.where((j) => j.esFavorito).toList();

  // Alternar el estado de favorito
  void toggleFavorito(Juego juego) {
    juego.esFavorito = !juego.esFavorito;
    notifyListeners(); // Notifica a todas las pantallas o componentes (Consumer)
  }
}