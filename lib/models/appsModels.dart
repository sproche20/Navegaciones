class Appsmodels {
  final int? id;
  final String urlImage;
  final String nombrePrograma;
  final String categoria;
  final String precio;
  Appsmodels({
    this.id = -1,
    required this.urlImage,
    required this.nombrePrograma,
    required this.categoria,
    required this.precio,
  });
  Appsmodels copyWith({
    int? id,
    String? urlImage,
    String? nombrePrograma,
    String? categoria,
    String? precio,
  }) {
    return Appsmodels(
        id: id ?? this.id,
        urlImage: urlImage ?? this.urlImage,
        nombrePrograma: nombrePrograma ?? this.nombrePrograma,
        categoria: categoria ?? this.categoria,
        precio: precio ?? this.precio);
  }

  factory Appsmodels.fromMap(Map<String, dynamic> map) {
    return Appsmodels(
        id: map['id'],
        urlImage: map['urlImage'],
        nombrePrograma: map['nombrePrograma'],
        categoria: map['categoria'],
        precio: map['precio']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'urlImage': urlImage,
      'nombrePrograma': nombrePrograma,
      'categoria': categoria,
      'precio': precio
    };
  }
}
