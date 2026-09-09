class Juego {
  final String id;
  final String titulo;
  final String genero;
  final String imagen;
  final String descripcion;
  final double calificacion;
  final String plataformas;
  bool esFavorito;

  Juego({
    required this.id,
    required this.titulo,
    required this.genero,
    required this.imagen,
    required this.descripcion,
    required this.calificacion,
    required this.plataformas,
    this.esFavorito = false,
  });
}