import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class PeluquerosScreen extends StatelessWidget {
  const PeluquerosScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Peluqueria peluqueria =
        Peluqueria(ModalRoute.of(context)!.settings.arguments as int);
    PageController pageController = PageController(viewportFraction: 0.75);

    List<Peluquero> peluqueros = [
      Peluquero(0, 'Fabio', 'Corte, Tinte, Barba, Champu'),
      Peluquero(1, 'Jorge', 'Corte, Tinte'),
      Peluquero(2, 'Vicenzo', 'Champu'),
      Peluquero(3, 'Simone', 'Corte, Barba'),
    ];

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
                padding: const EdgeInsets.only(
                    left: 8, top: 8, bottom: 8, right: 35),
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SmallText(
                text: 'Elige tu pelquero favorito',
                color: AppTheme.secondaryTextColor,
              ),
            ),
            Container(
              height: 450,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: peluqueros.length,
                  itemBuilder: (context, index) {
                    Peluquero peluquero = peluqueros[index];
                    return _buildPeluquerosCard(peluquero, context, peluqueria);
                  }),
            ),
          ],
        ));
  }
}

Widget _buildPeluquerosCard(
    Peluquero peluquero, context, Peluqueria peluqueria) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 350,
          decoration: const BoxDecoration(
            color: AppTheme.mainColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 1.0), //(x,y)
                blurRadius: 8.0,
              ),
            ],
          ),
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            width: 290,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 90,
                ),
                BigText(
                  text: peluquero.nombre,
                  color: AppTheme.secondaryTextColor,
                ),
                const SizedBox(
                  height: 10,
                ),
                BigText(
                    text: 'Servicios disponibles:',
                    color: AppTheme.secondaryTextColor,
                    size: 20),
                const SizedBox(
                  height: 10,
                ),
                SmallText(text: peluquero.servicios, color: Colors.black45),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 5),
                  child: IconButton(
                    iconSize: 40,
                    icon: const Icon(Icons.check_circle),
                    alignment: Alignment.bottomRight,
                    onPressed: () {
                      Navigator.pushNamed(context, 'servicios',
                          arguments: [peluqueria, peluquero]);
                    },
                    color: AppTheme.buttomColor,
                  ),
                )),
              ],
            ),
          ),
        ),
      ),
      const Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          maxRadius: 80,
          backgroundImage: AssetImage('assets/salon.jpg'),
        ),
      ),
    ],
  );
}

class Peluquero {
  int indice;
  final String nombre;
  final String servicios;
  Peluquero(this.indice, this.nombre, this.servicios);
}

class Peluqueria {
  int indice = 9999;
  String? nombre;
  final List<String> nombres = [
    "Manoli",
    "PELUCAPP-GRANADA",
    "PELUCAPP-CONGRESOS",
    "PELUCAPP-AYUNTAMIENTO",
    "PELUCAPP-PASEO DE LOS TRISTES",
    "PELUCAPP-ALBAYZIN",
    "PELUCAPP-CAMINO DE RONDA",
    "PELUCAPP-CARTUJA",
    "PELUCAPP-EL POBLAO",
    "PELUCAPP-LA CHANA",
  ];
  Peluqueria.fromNothing() {
    indice = 0;
    nombre = "null";
  }
  Peluqueria(this.indice) {
    nombre = nombres[indice];
  }
}
