//Definicion de un modelo de datos
class Cliente {

   final String? id;
   final String? nombre;
   final String? email;
   final String? celular;
   final String? clave;

  //Constructor
   const Cliente({ this.id,this.nombre,  this.email, this.celular, this.clave});

//Conversir de json al objeto computadora
  factory Cliente.fromMap(Map<String, dynamic> json) =>
      Cliente (id: json["id"], nombre: json["nombre"]  ,email: json["email"], celular: json["celular"], clave: json["clave"]);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'email': email,
      'celular': celular,
      'clave': clave,
    };
  }
}

