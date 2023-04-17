import 'package:flutter/material.dart';
import 'package:gms_check/gms_check.dart';
import 'package:movies/presintion/Browsersreen/BrowserlistScreen/Listgenersfilms.dart';
import 'package:movies/presintion/Browsersreen/Browserscreen.dart';
import 'package:movies/presintion/FilmdetilesScreen/FilmdetilesScreen.dart';
import 'package:movies/presintion/Homescreen/Homescreen.dart';
import 'package:movies/presintion/Searchscreen/Searchscreen.dart';
import 'package:movies/presintion/Startapp.dart';
import 'package:movies/presintion/provider/appprovider.dart';
import 'package:movies/presintion/theming/appthem.dart';
import 'package:movies/presintion/watchedlistscreen/watchedlistscreen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GmsCheck().checkGmsAvailability();
  runApp(ChangeNotifierProvider(create:(context) => AppProvider(),child:MyApp()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      theme: Appthem.themeData,
      routes: {
        Watchedlistscreen.RoutName:(context) => Watchedlistscreen(),
        Listgenersfilms.RoutName:(context) => Listgenersfilms(),
        FilmdetilesScreen.RoutName:(context) => FilmdetilesScreen(),
        Searchscreen.RoutName:(context) => Homescreen(),
         Browserscreen.RoutName:(context) => Homescreen(),
        Homescreen.RoutName:(context) => Homescreen(),
        Startapp.RoutName:(context) => Startapp(),
      },
      initialRoute: Startapp.RoutName,
    );
  }
  }

