import 'package:flutter/material.dart';

class AppTheme {
  static const Color mainTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondaryTextColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color backgroundColor = Color(0xFFECEFF1);
  static const Color primary = Color.fromRGBO(34, 34, 34, 1);
  static const Color secondary = Color.fromRGBO(34, 163, 159, 1);


  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      color: backgroundColor,
      elevation: 3,
      
    ),
    inputDecorationTheme: const InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: secondary),
      //Habilitado
      enabledBorder: OutlineInputBorder(
          //borderSide: BorderSide(color: primary),
          //borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
      //Foco
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondary),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      //Generico
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: AppTheme.primary,
        shape: StadiumBorder(),
        elevation: 0,
      ),
    ),
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: primary,
      unselectedItemColor: Colors.black26,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Colors.black38,
        size: 22,
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      elevation: 0,
    ),

  
  );
}
