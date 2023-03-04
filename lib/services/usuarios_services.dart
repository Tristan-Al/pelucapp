import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:http/http.dart' as http;

class UsuariosServices extends ChangeNotifier {
  final String _baseURL =
      "peluqueria-f52fb-default-rtdb.europe-west1.firebasedatabase.app";
  final List<Usuario> usuarios = [];
  Usuario? usuarioSeleccionado;
  bool isLoading = true;

  UsuariosServices() {
    loadUsuarios();
  }

  Future loadUsuarios() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseURL, 'usuarios.json');
    final resp = await http.get(url);
    final Map<String, dynamic> usuariosMap = json.decode(resp.body);

    usuariosMap.forEach((key, value) {
      final tempUsuario = Usuario.fromMap(value);
      tempUsuario.id = key;
      usuarios.add(tempUsuario);
    });

    isLoading = false;
    notifyListeners();

    return usuarios;
  }
}
