import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/model/Popular.dart';
import 'package:movies/presintion/filmstyle/filmstye2.dart';

import '../../../FilmdetilesScreen/FilmdetilesScreen.dart';

class filmsilde extends StatefulWidget {
  popular pop;

  filmsilde(this.pop);

  @override
  State<filmsilde> createState() => _filmsildeState();
}

class _filmsildeState extends State<filmsilde> {
  @override
  Widget build(BuildContext context) {
    var mediaqurey = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
          Navigator.pushNamed(context, FilmdetilesScreen.RoutName,arguments: widget.pop);
      },
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: mediaqurey.height*.294,
                width: mediaqurey.width*15,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w500/${widget.pop.backdropPath}',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                  width: mediaqurey.width*1,
                  height: mediaqurey.height*.27,
                  child: Image.asset('assets/images/play.png'))

            ],
          ),
          Positioned(
              top: mediaqurey.height * .139,
              left: 25,
              child: filmstyle2(filmsource: widget.pop)),
          Positioned(
            left: mediaqurey.width * .37,
            bottom: 2,
            child: Container(
              height: 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: mediaqurey.width * .4,
                    child: Text(
                      " ${widget.pop.title!}",
                      style: Theme.of(context).primaryTextTheme.titleMedium,
                    ),
                  ),
                  Text(
                    widget.pop.releaseDate!,
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
