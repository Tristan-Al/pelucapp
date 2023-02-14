import 'package:flutter/material.dart';
import 'package:pelucapp/widgets/widgets.dart';

class CitaScreen extends StatelessWidget {
  const CitaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSlider(novedades: [Text('novedad1'), Text('novedad2'), Text('novedad3') ]),
          ],
        ),
      )
    );
  }
}