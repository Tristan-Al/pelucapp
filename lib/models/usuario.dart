// To parse this JSON data, do
//
//     final producto = productoFromMap(jsonString);

import 'dart:convert';

class Usuario {
  Usuario({
    required this.email,
    this.imagen,
    required this.nombre,
    required this.password,
    required this.telefono,
    required this.verificado,
  });

   String? id;
  String email;
  String? imagen;
  String nombre;
  String password;
  int telefono;
  bool verificado;
  bool? terminos = false;

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

   String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        email: json["email"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        password: json["password"],
        telefono: json["telefono"],
        verificado: json["verificado"],
);

  Map<String, dynamic> toMap() => {
        "email": email,
        "imagen": imagen,
        "nombre": nombre,
        "password": password,
        "telefono": telefono,
        "verificado": verificado,
          };
}
