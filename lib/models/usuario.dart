// To parse this JSON data, do
//
//     final usuario = usuarioFromMap(jsonString);

import 'dart:convert';

class Reserva {
  Reserva({
    required this.fecha,
    required this.peluquero,
    required this.servicios,
    required this.usuario,
    this.anulada = false,
  });

  String fecha;
  String peluquero;
  Map<String, bool> servicios;
  String usuario;
  bool anulada;

  factory Reserva.fromJson(String str) => Reserva.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reserva.fromMap(Map<String, dynamic> json) => Reserva(
        fecha: json["fecha"],
        peluquero: json["peluquero"],
        servicios: Map.from(json["servicios"])
            .map((k, v) => MapEntry<String, bool>(k, v)),
        usuario: json["usuario"],
        anulada: json["anulada"] ?? false,
      );

  Map<String, dynamic> toMap() => {
        "fecha": fecha,
        "peluquero": peluquero,
        "servicios":
            Map.from(servicios).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "usuario": usuario,
        "anulada": anulada,
      };
}
