import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pelucapp/models/models.dart';
import 'package:pelucapp/models/reserva.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/services/reservas_services.dart';
import 'package:pelucapp/services/services.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MetodosDePagoScreen extends StatelessWidget {
  const MetodosDePagoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResumenArgs resumen =
        ModalRoute.of(context)!.settings.arguments as ResumenArgs;
    final double radius = 20;

    final reservaServices = Provider.of<ReservaServices>(context);

    final usuariosServices = Provider.of<UsuariosServices>(context);
    final Usuario usuario = usuariosServices.usuarioLogin!;

    Map<String, bool> hacerMapaDeServicios(List<Servicio> servicios) {
      return Map.fromIterable(
        servicios,
        key: (servicio) => servicio.id,
        value: (_) => true,
      );
    }

    Reserva reserva = new Reserva(
        fecha: resumen.hora.toString(),
        pago: "",
        peluquero: resumen.peluquero.id!,
        peluqueria: resumen.peluqueria.nif!,
        servicios: hacerMapaDeServicios(resumen.servicios),
        usuario: usuario.id!);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.mainTextColor),
        ),
        title: BigText(
          text: 'PELUCAPP',
          color: AppTheme.primary,
          size: 25,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(children: [
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Código de operación'),
                              content: Text(generarCodigo(resumen)),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    reserva.pago = "Bizum";
                                    reserva.codigoBizum =
                                        generarCodigo(resumen);

                                    reservaServices.create(reserva);
                                    reservaServices.reservas.add(reserva);
                                    Navigator.pushNamed(context, 'home');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  child: buildImage(
                      'https://taigua.cat/wp-content/uploads/2023/01/bizum-2.jpg'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, 'pasarela_de_pago',
                      arguments: reserva),
                  child: buildImage(
                    'https://imagenes.lainformacion.com/files/twitter_thumbnail/uploads/imagenes/2022/04/29/tarjetas-de-credito.jpeg',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
                side: BorderSide(color: Colors.black, width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Advertencia'),
                              content:
                                  Text('Debe realizar el pago previo servicio'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    reserva.pago = "Efectivo";
                                    reservaServices.create(reserva);
                                    reservaServices.reservas.add(reserva);
                                    Navigator.pushNamed(context, 'home');
                                    //seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  child: buildImage(
                    'https://blog.selfbank.es/wp-content/uploads/2020/09/GettyImages-1195108001.jpg',
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

String generarCodigo(ResumenArgs resumen) {
  String? resultadoCadena = resumen.peluqueria.nif!.substring(0, 3);
  resultadoCadena += resumen.peluquero.id!;
  resultadoCadena += DateFormat('ddMMyy').format(resumen.hora);
  //si lo hago como int me quita los primeros digitos si estos son 0
  return resultadoCadena;
}

Widget buildImage(String url) => Image.network(
      url,
      fit: BoxFit.cover,
      width: double.infinity,
    );
