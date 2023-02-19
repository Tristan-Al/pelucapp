import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pelucapp/screens/peluqueros_screen.dart';
import 'package:pelucapp/screens/servicios_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class ResumenPedidoScreen extends StatelessWidget {
  const ResumenPedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic>? data =
        ModalRoute.of(context)!.settings.arguments as List<Object>?;
    Peluqueria peluqueria = data?[0] as Peluqueria;
    Peluquero peluquero = data?[1] as Peluquero;
    List<Servicio> serviciosSeleccionados = data?[2];

    ResumenArgs resumen =
        ResumenArgs.sinFecha(peluqueria, peluquero, serviciosSeleccionados);

    String generarPrecio(ResumenArgs resumen) {
      String resultadoCadena;
      double sumaPrecios = 0;
      for (var servicio in resumen.servicios) {
        sumaPrecios += servicio.precio;
      }
      return sumaPrecios.toString();
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new,
              color: AppTheme.secondaryTextColor),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: BigText(
            text: 'PELUCAPP',
            color: AppTheme.secondaryTextColor,
          ),
        ),
        actions: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 35),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, 'notificaciones');
                  },
                  child: const Icon(
                    Icons.notifications_sharp,
                    color: AppTheme.secondaryTextColor,
                  )))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: BigText(
                text: 'Resumen pedido',
                color: AppTheme.secondaryTextColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            BigText(
              text: 'Peluquería:',
              color: AppTheme.secondaryTextColor,
            ),
            SizedBox(
              height: 10,
            ),
            SmallText(
              text: resumen.peluqueria.nombre!,
              color: AppTheme.secondaryTextColor,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: 'Peluquero:',
              color: AppTheme.secondaryTextColor,
            ),
            SizedBox(
              height: 10,
            ),
            SmallText(
              text: resumen.peluquero.nombre,
              color: AppTheme.secondaryTextColor,
              size: 30,
            ),
            SizedBox(
              height: 20,
            ),
            BigText(
              text: 'Servicios:',
              color: AppTheme.secondaryTextColor,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: resumen.servicios.length,
                  itemBuilder: (context, index) {
                    Servicio _servicio = resumen.servicios[index];
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text(_servicio.nombre),
                    );
                  }),
            ),
            Row(
              children: [
                BigText(
                  text: 'Fecha:',
                  color: AppTheme.secondaryTextColor,
                ),
                SizedBox(
                  width: 20,
                ),
                SmallText(
                  text: DateFormat('dd/MM/yyyy').format(resumen.hora),
                  color: AppTheme.secondaryTextColor,
                  size: 30,
                ),
              ],
            ),
            Row(
              children: [
                BigText(
                  text: 'Hora:',
                  color: AppTheme.secondaryTextColor,
                ),
                SizedBox(
                  width: 20,
                ),
                SmallText(
                  text: DateFormat('HH:mm').format(resumen.hora),
                  color: AppTheme.secondaryTextColor,
                  size: 30,
                ),
              ],
            ),
            Row(
              children: [
                BigText(
                  text: 'Precio:',
                  color: AppTheme.secondaryTextColor,
                ),
                SizedBox(
                  width: 20,
                ),
                SmallText(
                  text: generarPrecio(resumen) + "€",
                  color: AppTheme.secondaryTextColor,
                  size: 30,
                ),
              ],
            ),
            TextButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => MetodosDePago(
                  resumen: resumen,
                ),
              ),
              child: const Text('Métodos de pago'),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: AppTheme.buttomColor),
                  onPressed: serviciosSeleccionados.isEmpty
                      ? null
                      : () => {
                            Navigator.pushNamed(context, 'home')
                          },
                  child: const Text('Siguiente',
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResumenArgs {
  final Peluqueria peluqueria;
  final Peluquero peluquero;
  final List<Servicio> servicios;
  DateTime hora = DateTime.now();

  ResumenArgs.sinFecha(this.peluqueria, this.peluquero, this.servicios);
  ResumenArgs(this.peluqueria, this.peluquero, this.servicios, this.hora);
}

class MetodosDePago extends StatefulWidget {
  ResumenArgs resumen;

  MetodosDePago({Key? key, required this.resumen}) : super(key: key);

  @override
  _MetodosDePago createState() => _MetodosDePago(resumen);
}

class _MetodosDePago extends State<MetodosDePago> {
  bool seleccionado = false;

  static final double radius = 20;

  UniqueKey? keyTile;
  bool isExpanded = false;

  ResumenArgs resumen;
  _MetodosDePago(this.resumen) : super();

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

  String generarCodigo(ResumenArgs resumen) {
    String resultadoCadena = resumen.peluqueria.indice.toString();
    resultadoCadena += resumen.peluquero.indice.toString();
    resultadoCadena += DateFormat('ddMMyy').format(resumen.hora);
    //si lo hago como int me quita los primeros digitos si estos son 0
    return resultadoCadena;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Seleccione un método de pago'),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Card(
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
                      GestureDetector(
                        onTap: () => isExpanded ? shrinkTile() : expandTile(),
                        child: buildImage(
                            'https://taigua.cat/wp-content/uploads/2023/01/bizum-2.jpg'),
                      ),
                      buildText(context, 'Bizum', resumen)
                    ],
                  ),
                ),
              ),
            ),
            Card(
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
                      GestureDetector(
                        onTap: () => isExpanded ? shrinkTile() : expandTile(),
                        child: buildImage(
                          'https://imagenes.lainformacion.com/files/twitter_thumbnail/uploads/imagenes/2022/04/29/tarjetas-de-credito.jpeg',
                        ),
                      ),
                      buildText(context, 'Tarjeta', resumen),
                    ],
                  ),
                ),
              ),
            ),
            Card(
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
                      GestureDetector(
                        onTap: () => isExpanded ? shrinkTile() : expandTile(),
                        child: buildImage(
                          'https://blog.selfbank.es/wp-content/uploads/2020/09/GettyImages-1195108001.jpg',
                        ),
                      ),
                      buildText(context, 'Efectivo', resumen)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//tiene que recibir por parametros algo para saber que foto crear
  Widget buildImage(String url) => Image.network(
        url,
        fit: BoxFit.cover,
        width: double.infinity,
        height: 100,
      );

  Widget buildText(BuildContext context, String type, ResumenArgs resumen) {
    switch (type) {
      case "Tarjeta":
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTile,
            initiallyExpanded: isExpanded,
            childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
            title: Text(
              'Tarjeta',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    seleccionado = true;
                    Navigator.pushNamed(context, 'home');
                  },
                  child: Text('Pagar')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
context,
text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
color: isExpanded ? Colors.green : Colors.red,
),*/
          ),
        );
        break;

      case "Bizum":
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTile,
            initiallyExpanded: isExpanded,
            childrenPadding: EdgeInsets.all(8).copyWith(top: 0),
            title: Text(
              'Bizum',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
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
                                    seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                    seleccionado = true;
                  },
                  child: Text('Mostrar código')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
              context,
              text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
              color: isExpanded ? Colors.green : Colors.red,
            ),*/
          ),
        );
        break;

      case "Efectivo":
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTile,
            initiallyExpanded: isExpanded,
            childrenPadding: EdgeInsets.all(8).copyWith(top: 0),
            title: Text(
              'Efectivo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
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
                                    seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  child: Text('Pagar en caja')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
            ),*/
          ),
        );
        break;
      default:
        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: keyTile,
            initiallyExpanded: isExpanded,
            childrenPadding: EdgeInsets.all(8).copyWith(top: 0),
            title: Text(
              'DEFAULT',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            children: [
              ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('DEFAULT'),
                              content: Text('DEFAULTMSG'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'home');
                                    seleccionado = true;
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ));
                  },
                  child: Text('DEFAULTBUTTON')),
            ],
            /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
            ),*/
          ),
        );
        break;
    }
  }
}
