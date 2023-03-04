// To parse this JSON data, do
//
//     final peluqueros = peluquerosFromMap(jsonString);

import 'dart:convert';

class Peluquero {
    Peluquero({
        required this.atiende,
        this.imagen,
        required this.nombre,
        required this.telefono,
    });

    String? id;
    String atiende;
    String? imagen;
    String nombre;
    int telefono;

    factory Peluquero.fromJson(String str) => Peluquero.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Peluquero.fromMap(Map<String, dynamic> json) => Peluquero(
        atiende: json["atiende"],
        imagen: json["imagen"],
        nombre: json["nombre"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toMap() => {
        "atiende": atiende,
        "imagen": imagen,
        "nombre": nombre,
        "telefono": telefono,
    };
}
