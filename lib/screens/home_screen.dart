import 'package:flutter/material.dart';
import 'package:pelucapp/screens/screens.dart';
import 'package:pelucapp/theme/app_theme.dart';
import 'package:pelucapp/widgets/widgets.dart';

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
      resizeToAvoidBottomInset: false,
      extendBody: true,      
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: const BoxDecoration(
          color: AppTheme.mainColor,
          borderRadius: BorderRadius.all(Radius.circular(24)),
          boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
        ),
        child: BottomNavigationBar(        
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
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black26,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedIconTheme: const IconThemeData(
            color: Colors.black38,
          ),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),          
          elevation: 0,
        ),
      )
    );
  }
}