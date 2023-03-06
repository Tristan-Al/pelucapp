// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Reserva {
   String id;
  final DateTime fecha;
  final String peluquero;
  final List<String> servicios;
  final String usuario;

  Reserva({
    required this.id,
    required this.fecha,
    required this.peluquero,
    required this.servicios,
    required this.usuario,
  });

  factory Reserva.fromJson(String str) => Reserva.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Reserva.fromMap(Map<String, dynamic> json) {
    final id = json.keys.first;
    final fecha = DateTime.parse(json[id]['fecha']);
    final peluquero = json[id]['peluquero'];
    final servicios = List<String>.from(json[id]['servicios'].keys.toList());
    final usuario = json[id]['usuario'];
    return Reserva(
      id: id,
      fecha: fecha,
      peluquero: peluquero,
      servicios: servicios,
      usuario: usuario,
    );
  }

  Map<String, dynamic> toMap() => {
        id: {
          'fecha': fecha.toIso8601String(),
          'peluquero': peluquero,
          'servicios': Map.fromIterable(
            servicios,
            key: (servicio) => servicio,
            value: (_) => true,
          ),
          'usuario': usuario,
        },
      };
}
