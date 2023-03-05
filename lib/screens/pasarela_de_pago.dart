import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class PasarelaDePagoScreen extends StatelessWidget {
  const PasarelaDePagoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResumenArgs resumen =
        ModalRoute.of(context)!.settings.arguments as ResumenArgs;

    return const Scaffold(
      body: Center(child: Text('hola')),
    );
  }
}
