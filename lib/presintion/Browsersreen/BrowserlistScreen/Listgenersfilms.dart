import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bloclist.dart';

class Listgenersfilms extends StatefulWidget {
static String RoutName='listff';
  @override
  State<Listgenersfilms> createState() => _ListgenersfilmsState();
}

class _ListgenersfilmsState extends State<Listgenersfilms> {
  @override
  @override
  Widget build(BuildContext context) {
    var gener=ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("${gener['name']}"),
      ),
      body:bloclist(id: gener['id']) ,

    );
  }
}
