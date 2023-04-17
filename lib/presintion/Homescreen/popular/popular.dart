import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/domain/usecases/apiusecases.dart';
import 'package:movies/presintion/Homescreen/popular/filmslide/filmslide.dart';
import 'package:movies/presintion/Homescreen/popular/popular_viewmodel.dart';



class PopularFilms extends StatefulWidget {

  @override
  State<PopularFilms> createState() => _PopularFilmsState();
}

class _PopularFilmsState extends State<PopularFilms> {
    popular_viewmodel viewmodel=popular_viewmodel(ingectApicase());
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewmodel.getpopularfilms();
  }
  @override
  Widget build(BuildContext context) {
    var mediaqurey=MediaQuery.of(context).size;
    return Container(
      height: mediaqurey.height*.34,
      child: BlocBuilder<popular_viewmodel,PopularWidgetState>(
        bloc: viewmodel,
        builder:(context, state) {
          if(state is PopularResponce){
            return CarouselSlider(
              options: CarouselOptions(
                height: mediaqurey.height*.34,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                enlargeCenterPage: false,
                aspectRatio: 16 / 9,
                enableInfiniteScroll: true,
              ),
              items:state.list.map((pop) => filmsilde(pop)).toList()
              ,);
          }else if(state is PopularEroorState){
            return Text(state.error,style: TextStyle(color: Colors.white,fontSize:50 ),);
          }else
            return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
