import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movies/presintion/Homescreen/popular/popular.dart';
import 'package:movies/presintion/Homescreen/recommended/recommended.dart';

import '../../data/Apimanger/Apimanger.dart';
import 'new_relase/new_relase.dart';


class Homescreen extends StatefulWidget {
  static String RoutName ='Homescreen';
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Apimanger apimanger=Apimanger();
  Widget build(BuildContext context) {
    return Scaffold(
        body:SingleChildScrollView(
          reverse:  true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 35),
              PopularFilms(),
              Newrelase(),
              Recommended0(),
            ],
          ),
        )

    );
  }
}
