import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/model/whatchback.dart';
import '../FilmdetilesScreen/FilmdetilesScreen.dart';
import 'filmstye2.dart';

class liststyle3 extends StatelessWidget {
  List<watchback> list;
  VoidCallback? function;
  liststyle3({required this.list, this.function});
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.pushNamed(context, FilmdetilesScreen.RoutName,arguments: list[index]);
        },
        child: Container(
          padding: EdgeInsets.all(8),
          height: screen.height * .2,
          child: Row(
            children: [
              filmstyle2(filmsource: list[index],function: function),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: screen.width * .5,
                        child: Text(
                          list[index].title ?? '',
                          style: Theme.of(context)
                              .primaryTextTheme
                              .titleMedium,
                        )),
                    Text(list[index].releaseDate ?? '',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.copyWith(color: Colors.grey)),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                            width: screen.width * .5,
                            child: Text(list[index].overview ?? '',
                                style: Theme.of(context)
                                    .primaryTextTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(color: Colors.white),
    );
  }
}
