import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class PeluquerosServices extends ChangeNotifier {
  final String _baseURL =
      "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Reserva> reservas = [];
  Reserva? reservaSeleccionada;

  bool isLoading = true;

  PeluquerosServices() {
    this.loadReserva();
  }

  Future loadReserva() async {
    final url = Uri.https(_baseURL, 'reserva.json');
    final resp = await http.get(url);

    final Map<String, dynamic> reservaMap = json.decode(resp.body);

    reservaMap.forEach((key, value) {
      final tempReserva = Reserva.fromMap(value);
      tempReserva.id = key;
      this.reservas.add(tempReserva);
    });
  }
}
