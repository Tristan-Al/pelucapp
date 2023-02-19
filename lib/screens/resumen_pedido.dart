import 'package:flutter/material.dart';
import 'package:pelucapp/screens/peluqueros_screen.dart';
import 'package:pelucapp/screens/servicios_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class ResumenPedidoScreen extends StatelessWidget {
  const ResumenPedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  text: 'Peluquero:',
                  color: AppTheme.secondaryTextColor,
                ),
            SizedBox(
              height: 20,
            ),
            SmallText(
              text: 'Peluquero.nombre',
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
            SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Text('Servicio ${index}'),
                    );
                  }),
            ),
            MetodosDePago(),
          ],
        ),
      ),
    );
  }
}

class ResumenArgs {
  final Peluquero peluquero;
  final List<Servicio> servicios;
  final DateTime? fechaHora;
  ResumenArgs({required this.peluquero, required this.servicios, this.fechaHora});
}

class MetodosDePago extends StatefulWidget {
  const MetodosDePago({super.key});

  @override
  _MetodosDePago createState() => _MetodosDePago();
}

//ahora hay que pasar por parametros al constructor el texto y el boton
//para sustituirlo por los que hay aqui
class _MetodosDePago extends State<MetodosDePago> {
  bool seleccionado = false;

  static final double radius = 20;

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
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
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
                            onTap: () =>
                                isExpanded ? shrinkTile() : expandTile(),
                            child: buildImage(),
                          ),
                          //todo
                          Builder(
                            builder: (context) => (Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                key: keyTile,
                                initiallyExpanded: isExpanded,
                                childrenPadding:
                                    EdgeInsets.all(8).copyWith(top: 0),
                                title: Text(
                                  'Bizum',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text(
                                                      'Código de operación'),
                                                  content: Text('f45f1df6dg8d'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context, 'home');
                                                        seleccionado = true;
                                                      },
                                                      child: const Text('OK'),
                                                    ),
                                                  ],
                                                ));
                                        seleccionado = true;
                                        //ABRIR APP BANCO
                                      },
                                      child: Text('Mostrar código')),
                                ],
                                /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
          ),*/
                              ),
                            )),
                          ),
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
                            onTap: () =>
                                isExpanded ? shrinkTile() : expandTile(),
                            child: Image.network(
                              'https://imagenes.lainformacion.com/files/twitter_thumbnail/uploads/imagenes/2022/04/29/tarjetas-de-credito.jpeg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 100,
                            ),
                          ),
                          Builder(
                            builder: (context) => Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                key: keyTile,
                                initiallyExpanded: isExpanded,
                                childrenPadding:
                                    EdgeInsets.all(16).copyWith(top: 0),
                                title: Text(
                                  'Tarjeta',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
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
                            ),
                          ),
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
                            onTap: () =>
                                isExpanded ? shrinkTile() : expandTile(),
                            child: Image.network(
                              'https://blog.selfbank.es/wp-content/uploads/2020/09/GettyImages-1195108001.jpg',
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 100,
                            ),
                          ),
                          Builder(
                            builder: (context) => Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                key: keyTile,
                                initiallyExpanded: isExpanded,
                                childrenPadding:
                                    EdgeInsets.all(8).copyWith(top: 0),
                                title: Text(
                                  'Efectivo',
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title:
                                                      const Text('Advertencia'),
                                                  content: Text(
                                                      'Debe realizar el pago previo servicio'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context, 'home');
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
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: const Text('Métodos de pago'),
    );
  }

//tiene que recibir por parametros algo para saber que foto crear
  Widget buildImage() => Image.network(
        'https://taigua.cat/wp-content/uploads/2023/01/bizum-2.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 100,
      );

  Widget buildText(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(8).copyWith(top: 0),
          title: Text(
            '17/3/2023',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          children: [
            ElevatedButton(
                onPressed: () {
                  seleccionado = true;
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
}
