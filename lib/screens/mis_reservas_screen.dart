import 'package:flutter/material.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/models/usuario.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/reservas_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:provider/provider.dart';

import '../theme/app_theme.dart';
import '../widgets/widgets.dart';

class MisReservasScreen extends StatefulWidget {
  const MisReservasScreen({super.key});

  @override
  _MisReservasScreen createState() => _MisReservasScreen();
}

class _MisReservasScreen extends State<MisReservasScreen> {
  static final double radius = 20;

  static const List<Widget> _pages = <Widget>[
    CitaScreen(),
    MisReservasScreen(),
    call_screen(),
    ProfileHomePage(),
    PeluquerosScreen(),
  ];

  UniqueKey? keyTile;
  bool isExpanded = false;

  void expandTile() {
    setState(() {
      isExpanded = true;
      keyTile = UniqueKey();
    });
  }

  void shrinkTile() {
    setState(() {
      isExpanded = false;
      keyTile = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);

    List<Reserva> obtenerReservasUsuario(String usuario) {
      List<Reserva> reservas = ReservaServices().reservas;
      List<Reserva> reservasUsuario = [];
      for (var reserva in reservas) {
        if (reserva.usuario == usuario) {
          reservasUsuario.add(reserva);
        }
      }
      return reservasUsuario;
    }

    final usuariosServices = Provider.of<UsuariosServices>(context);
    final Usuario usuario = usuariosServices.usuarioLogin!;

    List<Reserva> reservas = obtenerReservasUsuario(usuario.nombre);

    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);

    return Scaffold(
      body: ListView.builder(
        itemCount: reservas.length /*peluqueriasServices.peluquerias.length*/,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            //Navigator.pushNamed(context, 'product');
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Colors.black, width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    buildImage(),
                    buildText(context, index),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildImage() => Image.network(
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 100,
      );

  Widget buildText(BuildContext context, index) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            'Nombre peluqueria',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          children: [
            Text('data: ${index}'),
            Text('data: ${index}'),
            Text('data: ${index}'),
            Text('data: ${index}'),
            Text('data: ${index}'),
            Text('data: ${index}'),
            ElevatedButton(
                onPressed: () {
                  print('hola');
                  //seleccionado = true;
                },
                child: Text('Cancelar')),
          ],
          /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
          ),*/
        ),
      );
}
