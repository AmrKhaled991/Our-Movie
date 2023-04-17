import 'package:flutter/material.dart';
import 'package:movies/presintion/Browsersreen/Browserscreen.dart';
import 'package:movies/presintion/Homescreen/Homescreen.dart';
import 'package:movies/presintion/Searchscreen/Searchscreen.dart';
import 'package:movies/presintion/provider/appprovider.dart';
import 'package:movies/presintion/theming/appthem.dart';
import 'package:movies/presintion/watchedlistscreen/watchedlistscreen.dart';
import 'package:provider/provider.dart';

class Startapp extends StatefulWidget {
  static String RoutName='home';

  @override
  State<Startapp> createState() => _StartappState();
}

class _StartappState extends State<Startapp> {
  @override

  int currentindex=0;

  List<Widget> listscreen=[Homescreen(),Searchscreen(),Browserscreen(),Watchedlistscreen()];
 @override

  Widget build(BuildContext context) {
   var provider=Provider.of<AppProvider>(context);
   provider.getlist();
    return Scaffold(

      bottomNavigationBar: Theme(
        data: Appthem.themeData,
        child: BottomNavigationBar(
          currentIndex: currentindex,
          onTap:(value) {
            currentindex=value;
            setState(() {
            });
          },
          items: [
            BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/home.png'),) ,label: 'Home',),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/search.png')) ,label: 'Search',),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/browser.png')) ,label: 'Browser',),
            BottomNavigationBarItem(icon:ImageIcon(AssetImage('assets/images/watchlist.png')) ,label: 'Watchedlist',),

          ],
        ),
      ),
      body: listscreen[currentindex],

    );
  }
}

