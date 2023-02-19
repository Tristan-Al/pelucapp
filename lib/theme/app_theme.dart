import 'package:flutter/material.dart';

class AppTheme {
  static const Color mainTextColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color secondaryTextColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color mainColor = Color(0xFFECEFF1);
  static const Color secondary = Colors.grey;
  static const Color buttomColor = Color(0xFFAA00FF);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: mainColor,
    appBarTheme: const AppBarTheme(
      color: mainColor,
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
        backgroundColor: AppTheme.buttomColor
      ),
    ),
    
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black26,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      unselectedIconTheme: IconThemeData(
        color: Colors.black38,
      ),
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      elevation: 0,
    ),

  
  );
}
