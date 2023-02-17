import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';

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
    PerfilScreen(),
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
  Widget build(BuildContext context) => Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12),
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
                          child: buildImage(),
                        ),
                        buildText(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildImage() => Image.network(
        'https://amabilia.es/wp-content/uploads/CG8_8071_MariaValls_Calanda-Teruel-17.jpg',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 100,
      );

  Widget buildText(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: keyTile,
          initiallyExpanded: isExpanded,
          childrenPadding: EdgeInsets.all(16).copyWith(top: 0),
          title: Text(
            '17/3/2023',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          children: [
            Text(
              'Hora: 16:00-16:45 \n20 euros',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            ElevatedButton(onPressed: () {}, child: Text('cancelar')),
          ],
          /*onExpansionChanged: (isExpanded) => Utils.showSnackBar(
            context,
            text: isExpanded ? 'Expand Tile' : 'Shrink Tile',
            color: isExpanded ? Colors.green : Colors.red,
          ),*/
        ),
      );
}
