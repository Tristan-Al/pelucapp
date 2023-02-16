import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class MiPerfil extends StatelessWidget {
  const MiPerfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              FadeInImage(
                  placeholder: AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(
                      'https://icones.pro/wp-content/uploads/2021/02/icone-utilisateur-gris.png'),
                  height: 320,
                  width: 320,
                  fit: BoxFit.cover,
                ),
                  Text(
          'Nombre: ',
          style: TextStyle(
          fontSize: 16, // tamaño de fuente en puntos
          color: Color.fromARGB(255, 0, 0, 0),
           // color de texto
      ),
                 ),

                 Text(
          'Apellidos: ',
          style: TextStyle(
          fontSize: 16, // tamaño de fuente en puntos
          color: Color.fromARGB(255, 0, 0, 0),
           // color de texto
      ),
                 ),

                 Text(
          'email: ',
          style: TextStyle(
          fontSize: 16, // tamaño de fuente en puntos
          color: Color.fromARGB(255, 0, 0, 0),
           // color de texto
      ),
                 ),
                
              ],
            )
              ),
            ),
            Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    primary:Color.fromARGB(255, 0, 0, 0),
                     shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15)),
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text('Editar mi perfil', style: TextStyle( fontSize: 20)),
                  
                ),
      
              ),
    
          ],
          
    );
     
  }
}