import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/domain/model/Popular.dart';
import 'package:movies/presintion/FilmdetilesScreen/SimilarList/SimilarList.dart';

import 'desfilm.dart';

class FilmdetilesScreen extends StatefulWidget {
  static String RoutName='FilmdetilesScreen';
  @override
  State<FilmdetilesScreen> createState() => _FilmdetilesScreenState();
}

class _FilmdetilesScreenState extends State<FilmdetilesScreen> {
  @override
  Widget build(BuildContext context) {
    var mediaqurey=MediaQuery.of(context).size;
    var film=ModalRoute.of(context)!.settings.arguments as dynamic;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(film.title!,style: Theme.of(context).primaryTextTheme.titleLarge,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: mediaqurey.height*.27,
                  width: double.infinity,
                    child:  film.backdropPath==null?Image.asset('assets/images/film.png'):Image.network(
                      'https://image.tmdb.org/t/p/w500/${film.backdropPath}',)

                ),
                Positioned(
                    width: mediaqurey.width*1,
                    height: mediaqurey.height*.27,
                    child: Image.asset('assets/images/play.png'))
              ],
            )
            ,Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start
                ,
                children: [
                  Text(film.title!,style: Theme.of(context).primaryTextTheme.titleMedium,),
                  Text(film.releaseDate==null?'':film.releaseDate,style: Theme.of(context).primaryTextTheme.titleSmall!.copyWith(color: Colors.grey),)
                  ,Container(
                    child: Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(5),
                            height: mediaqurey.height*.24,
                            width: mediaqurey.width*.35,
                            child: film.posterPath==null?Image.asset('assets/images/film.png'):Image.network(
            'https://image.tmdb.org/t/p/w500/${film.posterPath}',))
                        ,SizedBox(width:2 )
                        , Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            desfilm(film.id!),
                            SingleChildScrollView(
                              child: Container(
                                height: 70,
                                  width: mediaqurey.width*.55,
                                  child: Text("${film.overview!}",style: TextStyle(fontSize:12,color: CupertinoColors.white, ),)
                              ),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Theme.of(context).primaryColor, size: 25),
                                Text(
                                  '${film.voteAverage}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                 Similarlist(film.id!)
                ],
              ),
            )
          ],
    ),
      ),
    );
  }
}
