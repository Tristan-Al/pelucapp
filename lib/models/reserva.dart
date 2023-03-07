// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Reserva {
  Reserva({
    required this.fecha,
    required this.pago,
    required this.peluquero,
    required this.peluqueria,
    required this.servicios,
    required this.usuario,
    this.cancelada = false,
  });
  String? id;
  String fecha;
  String pago;
  String peluquero;
  String peluqueria;
  Map<String, bool> servicios;
  String usuario;
  bool cancelada;

  factory Reserva.fromJson(String str) => Reserva.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reserva.fromMap(Map<String, dynamic> json) => Reserva(
        fecha: json['fecha'],
        pago: json['pago'],
        peluquero: json['peluquero'],
        peluqueria: json['peluqueria'],
        servicios: Map.from(json['servicios'])
            .map((k, v) => MapEntry<String, bool>(k, v)),
        usuario: json['usuario'],
        cancelada: json['cancelada'],
      );

  Map<String, dynamic> toMap() => {
        'fecha': fecha,
        'peluquero': peluquero,
        'servicios':
            Map.from(servicios).map((k, v) => MapEntry<String, dynamic>(k, v)),
        'usuario': usuario,
        'cancelada': cancelada,
      };
}
