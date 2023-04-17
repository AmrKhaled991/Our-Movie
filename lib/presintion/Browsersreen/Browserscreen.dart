import 'package:flutter/material.dart';
import 'package:movies/presintion/Browsersreen/browserslide/browsercontuner.dart';

class Browserscreen extends StatelessWidget {
  @override
  static String RoutName = 'Browserscreen';

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Browser Category', style: Theme
            .of(context)
            .primaryTextTheme
            .titleLarge,),
      ),
      body: Browserslide()
    

    );
  }

}