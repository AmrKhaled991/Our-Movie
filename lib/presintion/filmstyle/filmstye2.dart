import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/model/whatchback.dart';
import 'package:movies/presintion/provider/appprovider.dart';
import 'package:movies/presintion/theming/appthem.dart';
import 'package:movies/presintion/watchedlistscreen/watchedlistscreen.dart';
import 'package:provider/provider.dart';

import '../../domain/model/reocommeded.dart';
import '../FilmdetilesScreen/FilmdetilesScreen.dart';
import '../Utiles.dart';

class filmstyle2 extends StatefulWidget {
  dynamic filmsource;
  VoidCallback? function;
  filmstyle2({this.filmsource, this.function});

  @override
  State<filmstyle2> createState() => _filmstyle2State();
}

class _filmstyle2State extends State<filmstyle2> {


  @override
  Widget build(BuildContext context) {
    var mediaqurey = MediaQuery
        .of(context)
        .size;
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, FilmdetilesScreen.RoutName,arguments: widget.filmsource);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Stack(
            children: [

              Stack(
              children: [
                Container(
                    height: mediaqurey.height * .15,
                    width: mediaqurey.width * .25,
                    child: widget.filmsource.posterPath==null?Image.asset('assets/images/film.png',fit: BoxFit.cover,):Image.network(
                      'https://image.tmdb.org/t/p/w500/${widget.filmsource.posterPath}',
                      fit: BoxFit.cover,
                    )),
                Stack(
                  children: [
                    CustomPaint(
                      size: Size(100, 130),
                      painter: RPSCustomPainter(
                          provider.check(getwatch()) == false ?
                          Appthem.filmsellect : Appthem.Goldcolor),
                    ),
                    Positioned(
                      top: 3,
                      left: 5,
                      child: InkWell(
                          onTap: () {
                            provider.addfilm(getwatch());
                         widget.function;
                          },
                          child: Icon(
                            provider.check(getwatch()) ==false?
                            Icons.add : Icons.check, color: Colors.white,
                            size: 20,)),
                    ),

                  ],
                ),
              ],
            ),


            ]
        ),
      ),
    );
  }
  watchback getwatch() {
    return watchback(title: widget.filmsource.title,
      voteAverage: widget.filmsource.voteAverage,
      overview: widget.filmsource.overview,
      id: widget.filmsource.id,
      posterPath: widget.filmsource.posterPath,
      releaseDate: widget.filmsource.releaseDate,
      backdropPath:  widget.filmsource.backdropPath,);
  }

} //https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
