import 'package:flutter/material.dart';

class AppTheme{
  static const Color primary = Color.fromRGBO(243, 239, 224, 1);
  static final ThemeData lightTheme = ThemeData.light().copyWith(

    primaryColor: primary,

    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 0,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: primary,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black26,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedIconTheme: IconThemeData(
        color: Colors.black38,
      ),
      
      elevation: 0,
    ),

    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      //Habilitado
      enabledBorder: OutlineInputBorder(
        //borderSide: BorderSide(color: primary),
        //borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //Foco
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primary),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //Generico
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    
  );
}