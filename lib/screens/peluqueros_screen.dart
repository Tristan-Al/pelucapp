
import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';

class PeluquerosScreen extends StatelessWidget {
  const PeluquerosScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    final List<_Peluquero> peluqueros = [ 
      _Peluquero('https://ww1.prweb.com/prfiles/2021/06/14/18006678/Fabio_PR.fw.png', 'Fabio', 'titolare'),
      _Peluquero('https://vivolabs.es/wp-content/uploads/2022/03/perfil-mujer-vivo.png', 'Fabiola','empleado'),
      _Peluquero('https://img.freepik.com/fotos-premium/perfil-retrato-joven-serio-imagen-hombre-guapo-barba_116317-13982.jpg?w=2000', 'Fabio', 'jefe'),
      _Peluquero('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVkz3sMnUJmvkNyaaxkgVpEIp0SRzaZQWITw&usqp=CAU', 'Fabio', 'gerente'),
      _Peluquero('https://ww1.prweb.com/prfiles/2021/06/14/18006678/Fabio_PR.fw.png', 'Fabio', 'titolare'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'PELUCAPP',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              
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
      body: Column(
        children: [
          Text(
            'Elije tu peluquero favorito',
            style: TextStyle(
              fontSize: 24,
              
            ),
          ),

          SizedBox(height: 70,),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _PeluqueroPoster(
                  imagen: 'https://ww1.prweb.com/prfiles/2021/06/14/18006678/Fabio_PR.fw.png', 
                  nombre: 'Fabio',
                  descripcion: 'titolare',
                  press: () { },
                ),

                _PeluqueroPoster(
                  imagen: 'https://vivolabs.es/wp-content/uploads/2022/03/perfil-mujer-vivo.png', 
                  nombre: 'Fabiola',
                  descripcion: 'gerente',
                  press: () { },
                ),

                _PeluqueroPoster(
                  imagen: 'https://img.freepik.com/fotos-premium/perfil-retrato-joven-serio-imagen-hombre-guapo-barba_116317-13982.jpg?w=2000', 
                  nombre: 'Jorge',
                  descripcion: 'vendedor',
                  press: () { },
                ),
              ],
            ),
          )
        ]
      ),
    );
  }
}
class _PeluqueroPoster extends StatelessWidget {
  const _PeluqueroPoster({
    super.key, this.nombre, this.descripcion, this.imagen, this.press,
  });

  final nombre;
  final descripcion;
  final imagen;
  final press;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: 10,
        top: 10 / 2,
        bottom: 10 * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.network(imagen),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(10 / 2),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: AppTheme.secondary,
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "$nombre\n".toUpperCase(),
                          style: Theme.of(context).textTheme.button
                        ),
                        TextSpan(
                          text: "$descripcion".toUpperCase(),
                          style: TextStyle(
                            color: AppTheme.secondary.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Peluquero {
  final String image;
  final String nombre;
  final String descripcion;

  _Peluquero(this.image, this.nombre, this.descripcion);
}
