

import 'package:flutter/material.dart';
import 'package:movies/presintion/filmstyle/filmstye.dart';
import 'package:movies/presintion/theming/appthem.dart';

import '../../domain/model/reocommeded.dart';

class liststyle extends StatelessWidget {
  List<dynamic>filmlist;
  liststyle(this.filmlist);
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text('Recommended',style: Theme.of(context).primaryTextTheme.titleMedium),
        ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
               itemCount: filmlist.length,
              itemBuilder:(context, index) => filmstyle(filmlist[index]),

          ),
        ),
      ],
    );
  }
}
