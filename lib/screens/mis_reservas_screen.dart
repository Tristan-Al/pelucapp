import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
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

    List<Reserva> obtenerReservasUsuario(String usuario_id) {
      List<Reserva> reservas = reservaServices.reservas;
      List<Reserva> reservasUsuario = [];
      for (var reserva in reservas) {
        if (reserva.usuario == usuario_id && !reserva.cancelada) {
          reservasUsuario.add(reserva);
        }
      }
      return reservasUsuario;
    }

    final usuariosServices = Provider.of<UsuariosServices>(context);
    final Usuario usuario = usuariosServices.usuarioLogin!;

    List<Reserva> reservas = obtenerReservasUsuario(usuario.id.toString());

    return Scaffold(
      body: ListView.builder(
        itemCount: reservas.length /*peluqueriasServices.peluquerias.length*/,
        itemBuilder: (BuildContext context, int index) {
          final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
          Peluqueria peluqueria = peluqueriasServices.peluquerias.firstWhere(
              (peluqueria) => peluqueria.nif == reservas[index].peluqueria);

          return GestureDetector(
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
                      buildImage(peluqueria.imagen!),
                      buildText(context, reservas[index]),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildImage(String url) => Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
      );

  Widget buildText(BuildContext context, Reserva reserva) {
    final ReservaServices reservaServices =
        Provider.of<ReservaServices>(context);
    final peluqueriasServices = Provider.of<PeluqueriasServices>(context);
    final serviciosServices = Provider.of<ServiciosServices>(context);
    final usuariosServices = Provider.of<UsuariosServices>(context);
    print(
        'nif de peluqueria: ${peluqueriasServices.peluquerias[1].nif}, nif de reserva: ${reserva.peluqueria}}');
    Peluqueria peluqueriaCita = peluqueriasServices.peluquerias
        .firstWhere((peluqueria) => peluqueria.nif == reserva.peluqueria);
    print('DATOSPELUQUERO: ${peluqueriaCita.peluqueros.toString()}');
    Peluquero peluqueroCita = peluqueriaCita.peluqueros.values.firstWhere(
        (peluquero) => peluquero.id == reserva.peluquero,
        orElse: () => new Peluquero(
            atiende: 'Default',
            horario: new Map(),
            nombre: 'peluquero no encontrado',
            servicios: new Map(),
            telefono: 0));
    List<Servicio> serviciosCita = serviciosServices.Servicios.where(
            (servicio) => reserva.servicios.keys.toList().contains(servicio.id))
        .toList();
    List<String> nombresServicios = serviciosCita.map((s) => s.nombre).toList();

    List<Servicio> filterServicios(List<Servicio> servicios, List<String> ids) {
      return servicios.where((servicio) => ids.contains(servicio.id)).toList();
    }

    double sumaPrecios =
        serviciosCita.fold(0, (total, servicio) => total + servicio.precio);

    int sumaTiempo = serviciosCita.fold<int>(
        0, (previousValue, servicio) => previousValue + servicio.tiempo);

    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        key: keyTile,
        initiallyExpanded: isExpanded,
        childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
        title: Text(
          '${peluqueriaCita.nombre}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        children: [
          Text('Peluquería:  ${peluqueriaCita.nombre}'),
          Text('Peluquero: ${peluqueroCita.nombre}'),
          Text('Dirección: ${peluqueriaCita.direccion}'),
          Text('Fecha: ${reserva.fecha.toString()}'),
          Text('Servicios: ${nombresServicios.toString()}'),
          Text('Pago: ${reserva.pago}'),
          Text('Código: ${reserva.codigoBizum}'),
          Text('Coste total: ${sumaPrecios}'),
          Text('Tiempo total: ${sumaTiempo}'),
          ElevatedButton(
              onPressed: () {
                //meter el sueldo
                usuariosServices.usuarioLogin!.saldo =
                    usuariosServices.usuarioLogin!.saldo! + sumaPrecios;
                usuariosServices.updateUsuario(usuariosServices.usuarioLogin!);
                reservaServices.cancelarReserva(reserva);
                Navigator.pushNamed(context, 'home');
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
}
