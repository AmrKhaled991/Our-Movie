import 'dart:ui';

import 'package:flutter/material.dart';

class Appthem {


  static Color Goldcolor = Color(0xffFFBB3B);
  static Color darbarkcolor = Color(0xff1A1A1A);
  static Color darkcolor = Color(0xff121312);
  static Color unselctedcolor = Color(0xffC6C6C6);
  static Color listcolor = Color(0xff282A28);
  static Color filmsellect = Color(0xff514F4F);

  static ThemeData themeData = ThemeData(
      primaryColor: Goldcolor,
      appBarTheme: AppBarTheme(
          color: darbarkcolor
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
         backgroundColor: darbarkcolor,
          selectedItemColor: Goldcolor,
          unselectedItemColor:unselctedcolor,
          selectedLabelStyle: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontSize: 8,fontWeight: FontWeight.bold),

      ),

      canvasColor: darbarkcolor,
      scaffoldBackgroundColor: darkcolor,

      primaryTextTheme: TextTheme(
          titleLarge: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
          titleMedium: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold),
          titleSmall: TextStyle(color: Color(0xB5B4B4), fontSize: 10,fontWeight: FontWeight.bold)
      )

  );

}