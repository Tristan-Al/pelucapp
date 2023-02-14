import 'package:flutter/material.dart';
import 'package:pelucapp/widgets/widgets.dart';

class CitaScreen extends StatelessWidget {
  
  const CitaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Novedades', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),

            CardSlider(novedades: [Text('novedad1'), Text('novedad2'), Text('novedad3'), Text('novedad 4') ]),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: const Text('Elige tu peluqueria', style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),

            SingleChildScrollView(
              child: Column(
                children: [
                  CustomCard(imageUrl: 'https://picsum.photos/500/300', name: 'Peluqueria 1',),
                  CustomCard(imageUrl: 'https://picsum.photos/500/300', name: 'Peluqueria 2',),
                  CustomCard(imageUrl: 'https://picsum.photos/500/300', name: 'Peluqueria 3',),
                  CustomCard(imageUrl: 'https://picsum.photos/500/300', name: 'Peluqueria 4',),
                  CustomCard(imageUrl: 'https://picsum.photos/500/300', name: 'Peluqueria 5',)
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}