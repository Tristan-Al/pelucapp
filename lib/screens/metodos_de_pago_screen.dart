import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class MetodosDePagoScreen extends StatelessWidget {
  const MetodosDePagoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResumenArgs resumen =
        ModalRoute.of(context)!.settings.arguments as ResumenArgs;
    final double radius = 20;
    return Scaffold(
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
                      arguments: resumen),
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
