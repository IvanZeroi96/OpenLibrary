class Favorite {
  final int? id;
  final String titulo;
  final String contenido;
  final String? autores;

  Favorite(
      { this.id,
        required this.titulo,
        required this.contenido,
        required this.autores});

  Favorite.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        titulo = res["titulo"],
        contenido = res["contenido"],
        autores = res["autores"];

  Map<String, Object?> toMap() {
    return {'id': id,'titulo': titulo, 'contenido': contenido, 'autores': autores};
  }
}