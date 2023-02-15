
import 'package:flutter/material.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class ServiciosScreen extends StatelessWidget {
  const ServiciosScreen({super.key,});

  @override
  Widget build(BuildContext context) {
    
    PageController pageController = PageController(viewportFraction: 0.75);

    List serviciosDisponibles = [
      _Servicio('Barba','15 minutos','Solo definicion de barba'), 
      _Servicio('Tinte','30 minutos','Tinte de pelo'), 
      _Servicio('Corte de pelo','30 minutos',''),
      _Servicio('Champu','15 minutos','Champu de balsamo'),
    ];
    
    return Scaffold(
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
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SmallText(text: 'Servicios', color: AppTheme.secondaryTextColor,),
            ),
            Container(
              height: 400,
              child: PageView.builder(
                controller: pageController,
                itemCount: serviciosDisponibles.length,
                itemBuilder: (context, index){
                  _Servicio servicio = serviciosDisponibles[index];
                  return _buildServiciosCard(servicio, context);
                }
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index){
                          _Servicio _servicio = serviciosDisponibles[index];
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

                     Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          backgroundColor: AppTheme.buttomColor
                        ),
                        onPressed: () {
                          
                        },
                        child: const Text('Siguiente', style: TextStyle( fontSize: 20)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}

Widget _buildServiciosCard(_Servicio servicio, context){
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(          
          height: 300,
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
            padding: EdgeInsets.only(left: 15,right: 15),
            width: 290,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BigText(text: servicio.nombre, color: AppTheme.secondaryTextColor,),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.timelapse_outlined, color: Colors.black38,),
                    SmallText(text: servicio.tiempo, color: Colors.black38,),
                  ],
                ),
                const SizedBox(height: 10,),
                SmallText(text: servicio.descripcion??"", color: Colors.black45),
                const SizedBox(height: 10,),
                Align(
                  alignment: Alignment.bottomRight,
                  child: IconButton(
                        iconSize: 40,
                        icon: const Icon(Icons.check_circle),
                        onPressed: () {
                          
                        },
                        color: AppTheme.buttomColor,
                      ),
                  ),
              ],
            ),
          ),
        ),
      ),
      const Align(
        alignment: Alignment.topCenter,
        child: CircleAvatar(
            maxRadius: 80,                     
            backgroundImage: AssetImage('assets/servicio.png')
           ),
      ),
    ],
  );
}

class _Servicio {
  final String nombre;
  final String tiempo;
  String? descripcion;
  _Servicio(this.nombre, this.tiempo, this.descripcion);
}