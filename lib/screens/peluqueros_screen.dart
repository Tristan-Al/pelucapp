import 'package:flutter/material.dart';
import 'package:pelucapp/widgets/widgets.dart';

class PeluquerosScreen extends StatelessWidget {
   
  const PeluquerosScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'PELUCAPP',
            style: TextStyle(color: Colors.black),
          ),
        ),
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 35),
            child: GestureDetector(
              onTap: () {
                
              },
              child: const Icon(
                Icons.notifications_sharp,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Peluqueros de: <Peluqueria Seleccionada>', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),

            CardSlider(novedades: [Text('novedad1'), Text('novedad2'), Text('novedad3'), Text('novedad 4') ]),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Servicios Disponibles', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),

            CardSlider(novedades: [Text('novedad1'), Text('novedad2'), Text('novedad3'), Text('novedad 4') ]),
          ],
        ),
      )
    );
  }
}