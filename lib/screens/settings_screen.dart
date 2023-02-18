import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          Text(
            'Settings',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
      ),
    ),
  ),
    body: Column(
         children: [ Container(
          
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Icon(Icons.edit, color: Color.fromARGB(255, 6, 6, 6)),
             GestureDetector(
              
          onTap: () {
            Navigator.pushNamed(context, 'editar');
          },
          child: Text('Editar mi perfil', style: TextStyle(fontSize: 20.0)),
        ),
        
                    ],
          ),
          
        ),
        Divider(),
         Container(
          
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Icon(Icons.edit, color: Color.fromARGB(255, 6, 6, 6)),
             GestureDetector(
              
          onTap: () {
            Navigator.pushNamed(context, '');
          },
          child: Text('Cambiar foto de perfil', style: TextStyle(fontSize: 20.0)),
        ),
        
                    ],
          ),
          
        ),
         Divider(),
         ],
      ),
    );
  }
}