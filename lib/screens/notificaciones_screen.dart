import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class NotificacionesScreen extends StatelessWidget {
   
  const NotificacionesScreen ({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {  
    return  Scaffold(
      appBar: AppBar(
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
                
              },
              child: const Icon(
                Icons.notifications_sharp,
                color: AppTheme.secondaryTextColor,
              )
            )
          )
        ],
      ), 
      body: Center(   
         child: Text(
          'Oops parece que no tienes notificaciones aún',
          style: TextStyle(
          fontSize: 14, // tamaño de fuente en puntos
          color: Color.fromARGB(255, 190, 174, 174),
           // color de texto
      ),
         ),
         
      ),
    );
  }
}