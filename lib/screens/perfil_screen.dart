import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});
  static String tProfileImage = "https://img.freepik.com/iconos-gratis/usuario_318-725053.jpg";

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
           appBar: AppBar(
             backgroundColor: Color.fromARGB(255, 41, 41, 41),
         leading: IconButton(
          onPressed: (){},
           icon: Icon(Icons.verified_user, color: Color.fromARGB(255, 255, 255, 255)),
        ),
         actions: <Widget>[
         IconButton(
          onPressed: (){
              Navigator.pushNamed(context, 'ajustes');
          },
           icon: Icon(Icons.settings, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        
         ],
        title: Center(
           child: Text(
            'My profile',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 255, 255, 255),
      ),
    ),
  ),
        ),
              body: ListView(
          children: <Widget>[
            Container(
              height: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 49, 49, 49), Color.fromARGB(255, 0, 0, 0)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 249, 249, 249),
                        minRadius: 40.0,
                        
                        child: CircleAvatar(
                              child: Icon(
                              Icons.camera_alt,
                              size: 15.0,
                            ),
                          radius: 30.0,
                          backgroundImage:
                              NetworkImage(tProfileImage),
                        ),
                        
                      ),
                      
                    ],
                  ),
                
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                    title: Text(
                      'Nombre',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Apellidos',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      'Email',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      '',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      );
  }
}