import 'package:flutter/material.dart';
import 'package:pelucapp/screens/cita_screen.dart';
import 'package:pelucapp/screens/screens.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    CitaScreen(), 
    Text('Index 1: Mis Reservas'), 
    Text('Index 2: Llamanos'), 
    Text('Index 3: Perfil'),  
    PeluquerosScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'PELUCAPP',
            style: TextStyle(color: Colors.black),
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(        
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cut),
            label: 'Pedir cita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections_bookmark),
            label: 'Mis reservas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Llamanos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}