
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pelucapp/screens/peluqueros_screen.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

class ServiciosScreen extends StatefulWidget {
  const ServiciosScreen({super.key,});

  @override
  State<ServiciosScreen> createState() => _ServiciosScreenState();
}

class _ServiciosScreenState extends State<ServiciosScreen> {

  List<Servicio> serviciosDisponibles = [
      Servicio('Barba','15 minutos','Solo definicion de barba'), 
      Servicio('Tinte','30 minutos','Tinte de pelo'), 
      Servicio('Corte de pelo','30 minutos',''),
      Servicio('Champu','15 minutos','Champu de balsamo'),
    ];

  List<Servicio> serviciosSeleccionados =[

    ];
    
  @override
  Widget build(BuildContext context) {
    Peluquero peluquero = ModalRoute.of(context)!.settings.arguments as Peluquero;

    PageController pageController = PageController(viewportFraction: 0.75);   
    
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
      body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: SmallText(text: 'Servicios', color: AppTheme.secondaryTextColor,),
            ),
            Container(
              height: 450,
              child: PageView.builder(
                controller: pageController,
                itemCount: serviciosDisponibles.length,
                itemBuilder: (context, index){
                  Servicio servicio = serviciosDisponibles[index];
                  bool selected = false;
                  if(serviciosSeleccionados.contains(servicio)){
                    selected = true;
                  }
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
                            padding: EdgeInsets.only(left: 15,right: 15),
                            width: 290,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(height: 90,),
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
                                Expanded(
                                child: Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    alignment: Alignment.bottomRight,
                                    child: Checkbox(
                                      value: selected, 
                                      onChanged:(value) {
                                        selected = value??true;
                                        if (selected){
                                          serviciosSeleccionados.add(servicio);
                                        }else{
                                          if(serviciosSeleccionados.contains(servicio)){
                                            serviciosSeleccionados.remove(servicio);
                                          }
                                        }
                                        setState(() {
                                          
                                        });
                                      },
                                    )
                                  ),
                                )
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
                        itemCount: serviciosSeleccionados.length,
                        itemBuilder: (context, index){
                          Servicio _servicio = serviciosSeleccionados[index];
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
                        onPressed: serviciosSeleccionados.isEmpty ? null : () => {
                          Navigator.pushNamed(context, 'horario', arguments: ResumenArgs(peluquero, serviciosSeleccionados))
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

class Servicio {
  final String nombre;
  final String tiempo;
  String? descripcion;
  Servicio(this.nombre, this.tiempo, this.descripcion);
}