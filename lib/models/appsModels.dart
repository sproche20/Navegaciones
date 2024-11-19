class Appsmodels {
  final int? id;
  final String urlImage;
  final String nombrePrograma;
  final String precio;
  Appsmodels({
    this.id = -1,
    required this.urlImage,
    required this.nombrePrograma,
    required this.precio,
  });
  Appsmodels copyWith({
    int? id,
    String? urlImage,
    String? nombrePrograma,
    String? precio,
  }) {
    return Appsmodels(
        id: id ?? this.id,
        urlImage: urlImage ?? this.urlImage,
        nombrePrograma: nombrePrograma ?? this.nombrePrograma,
        precio: precio ?? this.precio);
  }

  factory Appsmodels.fromMap(Map<String, dynamic> map) {
    return Appsmodels(
        id: map['id'],
        urlImage: map['urlImage'],
        nombrePrograma: map['nombrePrograma'],
        precio: map['precio']);
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'urlImage': urlImage,
      'nombrePrograma': nombrePrograma,
      'precio': precio
    };
  }
}
