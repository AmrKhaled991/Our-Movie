import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/model/whatchback.dart';
import 'package:movies/presintion/FilmdetilesScreen/FilmdetilesScreen.dart';
import 'package:movies/presintion/provider/appprovider.dart';
import 'package:movies/presintion/theming/appthem.dart';
import 'package:provider/provider.dart';

import '../../domain/model/reocommeded.dart';
import '../Utiles.dart';

class filmstyle extends StatefulWidget {
  dynamic filmsource;

  filmstyle(this.filmsource);

  @override
  State<filmstyle> createState() => _filmstyleState();
}

class _filmstyleState extends State<filmstyle> {

  @override
  Widget build(BuildContext context) {
    var mediaqurey = MediaQuery
        .of(context)
        .size;
    var provider = Provider.of<AppProvider>(context);
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, FilmdetilesScreen.RoutName, arguments: widget.filmsource);
      },
      child: Container(
        width: mediaqurey.width * .33,
        child: Stack(
            children: [
              Container(
                height: mediaqurey.height * .7,
                child: Card(
                  elevation: 15,
                  color: Appthem.listcolor,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      Stack(
                        children: [
                          Container(
                              height: mediaqurey.height * .17,
                              width: double.infinity,
                              child: widget.filmsource.posterPath == null ? Image
                                  .asset('assets/images/film.png') : Image.network(
                                'https://image.tmdb.org/t/p/w500/${widget.filmsource
                                    .posterPath}',
                                fit: BoxFit.fill,
                              )
                          ),

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
                                      setState(() {});
                                      provider.addfilm(getwatch());
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
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.5),
                        child: Text(widget.filmsource.title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500)),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Theme
                              .of(context)
                              .primaryColor, size: 15),
                          Text(
                            '${widget.filmsource.voteAverage}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w500),
                          )
                        ],

                      ),


                    ]),
                  ),
                ),
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
