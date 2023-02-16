import 'package:flutter/material.dart';
import 'package:pelucapp/screens/peluqueros_screen.dart';
import 'package:pelucapp/screens/servicios_screen.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class ResumenPedidoScreen extends StatelessWidget {
  const ResumenPedidoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ResumenArgs resumen = ModalRoute.of(context)!.settings.arguments as ResumenArgs;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon: Icon(Icons.arrow_back_ios_new, color: AppTheme.secondaryTextColor),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 20),
          child: BigText(text: 'PELUCAPP', color: AppTheme.secondaryTextColor,),
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
              )
            )
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: BigText(text: 'Resumen pedido',color: AppTheme.secondaryTextColor,),),
            SizedBox(height: 20,),
            Row(
              children: [
                BigText(text: 'Peluquero:',color: AppTheme.secondaryTextColor,),
                SizedBox(width: 20,),
                SmallText(text: resumen.peluquero.nombre ,color: AppTheme.secondaryTextColor,size: 30,),
              ],
            ),
            SizedBox(height: 20,),
            BigText(text: 'Servicios:',color: AppTheme.secondaryTextColor,),
            SizedBox(height: 20,),
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: resumen.servicios.length,
                itemBuilder: (context, index){
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
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResumenArgs {
  final Peluquero peluquero;
  final List<Servicio> servicios;

  ResumenArgs(this.peluquero, this.servicios);
}